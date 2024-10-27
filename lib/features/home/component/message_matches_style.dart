import 'package:flutter/material.dart';

class MessageMatchesStyle extends StatelessWidget {
  final String userImage;
  const MessageMatchesStyle({super.key, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 2, color: const Color(0xFFE94057))
            ),
            child: Container(
              height: 70,
              width: 70,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.grey,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Image.asset("assets/images/$userImage", fit: BoxFit.cover,),
            ),
          ),
          Text(
            "username..",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }
}
