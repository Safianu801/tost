import 'dart:io';
import 'dart:convert'; // Ensure you import the jsonEncode and base64Encode functions.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../services/authentication_service.dart';
import '../../../../services/user_provider.dart';
import '../../../../utilities/custom_back_navigator.dart';
import '../../../../utilities/custom_button_one.dart';
import '../../../../utilities/custom_loader.dart';
import '../../../../utilities/large_text_space.dart';

class AboutYouScreen extends StatefulWidget {
  final String userGender;
  final String userAge;
  final List<String> hobbies;
  final String locationRange;
  final List<String>? selectedImages;
  final String latitude;
  final String longitude;

  const AboutYouScreen({
    super.key,
    required this.userGender,
    required this.userAge,
    required this.hobbies,
    required this.locationRange,
    required this.selectedImages,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<AboutYouScreen> createState() => _AboutYouScreenState();
}

class _AboutYouScreenState extends State<AboutYouScreen> {
  final aboutYouController = TextEditingController();
  bool _isLoading = false;

  final AuthenticationService _authenticationService = AuthenticationService();

  Future<void> _createProfile(
      BuildContext context, String userBio, String userID) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await _authenticationService.createProfile(
          context: context,
          gender: widget.userGender,
          dob: widget.userAge,
          hobbies: widget.hobbies.join(","),
          bio: userBio,
          range: widget.locationRange,
          longitude: widget.longitude,
          latitude: widget.latitude,
          userID: userID,
          base64Images: widget.selectedImages);

      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${err.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).profile;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: CustomBackNavigator(onPress: () {
              Navigator.pop(context);
            }),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(
              children: [
                const Center(
                  child: Text(
                    "About You",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
                const Center(
                  child: Text(
                    "Here's what you want TOST users to know \nabout you",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 50),
                LargeTextSpace(
                    hintText: "About You",
                    obscureText: false,
                    controller: aboutYouController),
                const SizedBox(height: 55),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 8.0),
                  child: CustomButtonOne(
                    title: "SAVE",
                    onPress: () => _createProfile(
                        context, aboutYouController.text.trim(), user.id),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isLoading) const CustomLoaderOverlay(),
      ],
    );
  }
}
