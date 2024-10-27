import 'package:flutter/material.dart';

class CustomBackNavigator extends StatelessWidget {
  final VoidCallback onPress;
  const CustomBackNavigator({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onPress,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey)
            ),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(Icons.arrow_back_ios, size: 18, color: Color(0xFFE94057),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
