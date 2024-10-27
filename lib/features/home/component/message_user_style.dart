import 'package:flutter/material.dart';

import '../../Messages/screens/chat_screen.dart';

class MessageUserStyle extends StatelessWidget {
  final String userImage;
  const MessageUserStyle({super.key, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreen(userImage: userImage)));
        },
        child: Column(
          children: [
            Container(
              height: 70,
              width: 70,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle
              ),
              child: Image.asset("assets/images/$userImage", fit: BoxFit.cover,),
            ),
            const Text(
              "username..",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      ),
    );
  }
}
