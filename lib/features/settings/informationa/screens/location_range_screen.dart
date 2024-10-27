import 'dart:math'; // Import dart:math for mathematical functions
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast_mobile/features/settings/informationa/screens/upload_prodile_image_screen.dart';

import '../../../../utilities/custom_back_navigator.dart';
import '../../../../utilities/custom_button_one.dart';

class LocationRangeScreen extends StatefulWidget {
  final String userGender;
  final String userAge;
  final List<String> hobbies;

  const LocationRangeScreen({
    super.key,
    required this.userGender,
    required this.userAge,
    required this.hobbies,
  });

  @override
  State<LocationRangeScreen> createState() => _LocationRangeScreenState();
}

class _LocationRangeScreenState extends State<LocationRangeScreen> {
  double _sliderValue = 0.0;
  String _latitude = '37.7749';  // Example initial latitude (San Francisco)
  String _longitude = '-122.4194'; // Example initial longitude (San Francisco)

  // Function to calculate new latitude based on distance
  double _calculateLatitude(double initialLatitude, double distanceMeters) {
    // Each degree of latitude is approximately 111 km (111,000 meters)
    double distanceInDegrees = distanceMeters / 111000.0;
    return initialLatitude + distanceInDegrees;
  }

  // Function to calculate new longitude based on distance
  double _calculateLongitude(double initialLongitude, double initialLatitude, double distanceMeters) {
    // The length of one degree of longitude varies based on latitude
    double metersPerDegree = 111320 * (cos(initialLatitude * (pi / 180)));
    double distanceInDegrees = distanceMeters / metersPerDegree;
    return initialLongitude + distanceInDegrees;
  }

  String _getDistanceString(double value) {
    if (value < 1000) {
      return '${value.toInt()}m';
    } else {
      double km = value / 1000;
      return '${km.toStringAsFixed(1)}km';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackNavigator(onPress: () {
          Navigator.pop(context);
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const Text(
              "Location Range",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const Text(
              "Set your preferred distance for tailored\n connections and matches",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Distance",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _getDistanceString(_sliderValue),
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 3.5,
                      child: CupertinoSlider(
                        activeColor: const Color(0xFFE94057),
                        thumbColor: const Color(0xFFE94057),
                        value: _sliderValue,
                        min: 0.0,
                        max: 500000.0, // Max distance in meters (500km)
                        onChanged: (value) {
                          setState(() {
                            _sliderValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            CustomButtonOne(
              title: "NEXT",
              onPress: () {
                // Convert latitude and longitude to double for calculation
                double initialLatitude = double.parse(_latitude);
                double initialLongitude = double.parse(_longitude);

                // Calculate the new latitude and longitude based on slider value
                double newLatitude = _calculateLatitude(initialLatitude, _sliderValue);
                double newLongitude = _calculateLongitude(initialLongitude, initialLatitude, _sliderValue);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UploadProfileImageScreen(
                      userGender: widget.userGender,
                      userAge: widget.userAge,
                      hobbies: widget.hobbies,
                      locationRange: _sliderValue.toString(),
                      latitude: newLatitude.toString(),
                      longitude: newLongitude.toString(),
                    ),
                  ),
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
