import 'package:flutter/material.dart';

import '../../../utilities/bottom_navigation_bar.dart';
import '../../../utilities/custom_button_one.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                border: Border.all(width: 13, color: const Color(0xFFEE576C)),
                shape: BoxShape.circle
              ),
            ),
          ),
          const SizedBox(height: 10,),
          const Text(
            "WELCOME!",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25
            ),
          ),
          const Text(
            "USER_NAME!",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25
            ),
          ),
          const Spacer(),
          CustomButtonOne(title: "Home", onPress: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CustomBottomNavigationBar()));
          }),
          const Spacer(),
        ],
      ),
    );
  }
}
