import 'package:flutter/material.dart';

class CustomButtonThree extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const CustomButtonThree({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width/1.8,
        decoration: BoxDecoration(
            color: const Color(0xFFE94057),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: Text(title, style: const TextStyle(
              color: Colors.white
          ),),
        ),
      ),
    );
  }
}
