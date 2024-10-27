import 'package:flutter/material.dart';

class IntroItemStyle extends StatelessWidget {
  final String introImage;
  final String introTitle;
  final String introSubMessage;
  const IntroItemStyle({super.key, required this.introImage, required this.introTitle, required this.introSubMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(
            height: 300,
            width: 500,
            child: Image.asset("assets/images/$introImage"),
          ),
          SizedBox(height: 20,),
          Text(
            introTitle,
            style: const TextStyle(
              color: Color(0xFFE94057),
              fontSize: 27,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 30,),
          Text(
            introSubMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
