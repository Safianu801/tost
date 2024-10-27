import 'package:flutter/material.dart';

import '../../../utilities/custom_button_one.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "SET LOCATION",
              style: TextStyle(
                color: Color(0xFFE94057),
                fontSize: 25,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/images/map-marker-filled.png", scale: 0.3, color: const Color(0xFFE94057),),
          ),
          const Spacer(),
          CustomButtonOne(title: "SET", onPress: (){}),
          const Spacer()
        ],
      ),
    );
  }
}
