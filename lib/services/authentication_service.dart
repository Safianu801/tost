import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../features/authentication/screens/register/email_verification.dart';
import '../models/user_model.dart';
import '../utilities/bottom_navigation_bar.dart';
import '../utilities/server_url.dart';
import 'user_provider.dart';

class AuthenticationService with ChangeNotifier {
  String baseUrl = serverUrl;

  //register
  Future<void> registerUser(BuildContext context, String firstName,
      String lastName, String email, String phone, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/register"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "phone": phone,
          "password": password
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData.containsKey('data') && responseData['data'] is Map) {
          String userEmail = responseData['data']['email'];
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EmailVerification(email: userEmail),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Invalid response format")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registration Failed")),
        );
      }
    } catch (err) {
      print(err);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An error occurred. Please try again.")),
      );
    }
  }

  //login
  Future<void> userLogin(
      BuildContext context, String email, String password) async {
    try {
      final response = await http.post(Uri.parse("$baseUrl/login"),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({"email": email, "password": password}));
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Login Successful")));
        final decodedResponse = jsonDecode(response.body);
        final profileData = decodedResponse['data'];
        final profile = Profile.fromMap(profileData);
        Provider.of<UserProvider>(context, listen: false)
            .setUser(profile.toJson());
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CustomBottomNavigationBar()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Login Failed")));
      }
    } catch (err) {
      print(err);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $err")));
    }
  }

  Future<void> createProfile({
    required BuildContext context,
    required String gender,
    required String dob,
    required String hobbies,
    required String bio,
    required String range,
    required String longitude,
    required String latitude,
    required String userID,
    List<String>? images,
  }) async {
    try {
      final uri = Uri.parse("$baseUrl/profile/$userID");
      final request = http.MultipartRequest('PUT', uri)
        ..headers['Content-Type'] = 'multipart/form-data'
        ..fields['gender'] = gender
        ..fields['dob'] = dob
        ..fields['hobbies'] = hobbies
        ..fields['bio'] = bio
        ..fields['range'] = range
        ..fields['longitude'] = longitude
        ..fields['latitude'] = latitude;

      if (images != null) {
        for (var image in images) {
          final multipartFile = await http.MultipartFile.fromPath(
            'photos', 
            image,
          );
          request.files.add(multipartFile);
        }
      }

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final statusCode = response.statusCode;

      final jsonResponse = json.decode(responseBody);

      if (statusCode == 201 || statusCode == 200) {
        print("Success: $jsonResponse");
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile created successfully!")),
        );
      } else {
        print("Error: $jsonResponse");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text("Error creating profile: ${jsonResponse['message']}")),
        );
      }
    } catch (error) {
      print('Error creating profile: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text("An error occurred while creating the profile: $error")),
      );
    }
  }

  Future<void> getOTP(BuildContext context) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/send-otp"),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${data['message']}")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Unable To Send OTP Please Try Again Later")));
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
    }
  }

  Future<void> verifyOTP(BuildContext context, String userId, int otp) async {
    try {
      final response = await http.post(Uri.parse("$baseUrl/verify-account"),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"userId": userId, "otp": otp}));
      print(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("OtP Verified Successfully")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Unable To Verify This OTP")));
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
    }
  }

  Future<void> resetPassword(BuildContext context, String email) async {
    try {
      final response = await http.post(Uri.parse("$baseUrl/reset-password"),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"email": email}));
      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("OTP Sent to your email")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Unable To Send OTP to this email you provided")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
    }
  }

  Future<void> updatePassword(
      BuildContext context, int otp, String email, String password) async {
    try {
      final response = await http.post(Uri.parse("$baseUrl/update-password"),
          headers: {"Content-Type": "application/json"},
          body:
              json.encode({"otp": otp, "email": email, "password": password}));
      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Password Updated Successfully")));
        Navigator.pop(context);
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Unable To Update Password")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
    }
  }

  Future<void> getUserProfile(BuildContext context, String userId) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/profile/$userId"),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200 || response.statusCode == 201) {
      } else {}
    } catch (e) {}
  }

  Future<void> updateProfileData(BuildContext context, String userId,
      String range, String longitude, String latitude) async {
    try {
      final response = await http.post(Uri.parse("$baseUrl/profile/$userId"),
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            "range": range,
            "longitude": longitude,
            "latitude": latitude,
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
      } else {}
    } catch (e) {}
  }

  Future<void> getLikesForAUser(BuildContext context, String userId) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/likes/$userId"),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200 || response.statusCode == 201) {
      } else {}
    } catch (e) {}
  }

  Future<void> unlikeProfile(BuildContext context, String userId) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/likes/$userId"),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200 || response.statusCode == 201) {
      } else {}
    } catch (e) {}
  }

  Future<void> likeProfile(
      BuildContext context, String userId, String profileId) async {
    try {
      final response = await http.post(Uri.parse("$baseUrl/likes/like"),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"userId": userId, "profileId": profileId}));
      if (response.statusCode == 200 || response.statusCode == 201) {
      } else {}
    } catch (e) {}
  }
// Future<void> getLikesForAUser(BuildContext context, String userId) async {
//   try {
//     final response = await http.get(Uri.parse("$baseUrl/likes/$userId"),
//         headers: {
//           "Content-Type": "application/json"
//         }
//     );
//     if (response.statusCode == 200 || response.statusCode == 201) {
//
//     } else {
//
//     }
//   } catch (e) {
//
//   }
// }
// Future<void> getLikesForAUser(BuildContext context, String userId) async {
//   try {
//     final response = await http.get(Uri.parse("$baseUrl/likes/$userId"),
//         headers: {
//           "Content-Type": "application/json"
//         }
//     );
//     if (response.statusCode == 200 || response.statusCode == 201) {
//
//     } else {
//
//     }
//   } catch (e) {
//
//   }
// }
}
