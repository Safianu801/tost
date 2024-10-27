import 'package:flutter/material.dart';

class CustomButtonTwo extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const CustomButtonTwo({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 45,
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
