import 'package:flutter/material.dart';

class SettingsComponents extends StatelessWidget {
  final String settingsTitle;
  final String imageIcon;
  final String? label;
  final VoidCallback onPress;
  const SettingsComponents({super.key, required this.settingsTitle, required this.onPress, this.label, required this.imageIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: GestureDetector(
        onTap: onPress,
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  color: Colors.transparent
                ),
                child: Image.asset("assets/images/$imageIcon", color: const Color(0xFFE94057),),
              ),
              const SizedBox(width: 10,),
              Text(
                settingsTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16
                ),
              ),
              const Spacer(),
              label != null ? Text(label!, style: const TextStyle(fontSize: 16),) : const Icon(Icons.arrow_forward_ios, size: 15, color: Colors.grey,)
            ],
          ),
        ),
      ),
    );
  }
}
