import 'package:flutter/material.dart';

class CustomButtonOne extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const CustomButtonOne({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width/2,
        decoration: BoxDecoration(
          color: const Color(0xFFE94057),
          borderRadius: BorderRadius.circular(50)
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
