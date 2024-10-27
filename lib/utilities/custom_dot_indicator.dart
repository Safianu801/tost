import 'package:flutter/material.dart';

class CustomDotIndicator extends StatelessWidget {
  final bool isIndex;
  final Color activeColor;
  const CustomDotIndicator({super.key, required this.isIndex, required this.activeColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 13,
        width: 13,
        decoration: BoxDecoration(
          color: activeColor,
          shape: BoxShape.circle
        ),
      ),
    );
  }
}
