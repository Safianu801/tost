import 'package:flutter/material.dart';

class CardSelector extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const CardSelector({
    Key? key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFE94057) : Colors.transparent,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: isSelected ? const Color(0xFFE94057).withOpacity(0.4) : Colors.transparent,
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
            border: Border.all(
              width: 1,
              color: isSelected ? const Color(0xFFE94057) : Colors.grey.withOpacity(0.4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  icon,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
