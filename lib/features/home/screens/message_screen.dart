import 'dart:math';

import 'package:flutter/material.dart';

import '../component/message_matches_style.dart';
import '../component/message_user_style.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List demoUsers = [
    "img_photo_6.png",
    "img_photo_10.png",
    "img_photo_11.png",
    "img_photo_12.png",
    "img_photo_13.png",
    "img_photo_14.png",
    "1d52811c655e60bc6f528e769183d432.jpg",
    "4fead3663a9fead2727575992eec94c9.jpg",
    "7b9950d9ef7d59379f8659f1e7777346.jpg",
    "7ca65371ba0b2065450b087bafb57657.jpg",
    "7fd9a16807ff1b7bced0168e49ae911d.jpg",
    "18ca671a517cd94af3113f93f2621fa3.jpg",
    "22f62ce8bfd97e0810c6fd62cb1d88ab.jpg",
    "36f3691c9eb69ef4cbab9890cf1a98c5.jpg",
    "72e9f5edadd5f18b107d22996ef32427.jpg",
    "89c43dbafea46cb01542a48bde88f68b.jpg",
    "433c7c813f45c16b4cbfae47c545a679.jpg",
    "843fc1a7b1a4d9d9da938e027b1ce980.jpg",
    "3870f6cb56792c1eea9ad5df08a13058.jpg",
    "5413fe82e4fe89e3660ac46bac41ecc4.jpg",
    "90903b3f4d5524f392b1f2bc1739ecd9.jpg",
    "d651f7aca997415fe05fcb5f4d8896a6.jpg",
    "dbaa32832d5ad9cc833ddf6479dab288.jpg",
  ];
  final searchUserController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     TextSpace(obscureText: false, controller: searchUserController, hintText: "Search.......", prefixIcon: const Icon(Icons.search, color: Color(0xFFE94057),), suffixIcon: null),
              //     IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert, color: Color(0xFFE94057),))
              //   ],
              // ),
              const SizedBox(height: 10,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Matches",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)
                  ),
                  Text(
                    "Messages",
                      style: TextStyle(
                          color: Color(0xFFE94057),
                          fontSize: 20,
                          fontWeight: FontWeight.w500)
                  )
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: demoUsers.length,
                          itemBuilder: (context, index) {
                            return MessageMatchesStyle(userImage: demoUsers[Random().nextInt(demoUsers.length)]);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent
                        ),
                        child: Column(
                          children: [
                            //voice message
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color(0xFFE94057),
                                shape: BoxShape.circle
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Image.asset("assets/images/feather_mic.png", color: Colors.white,),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            //video message
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color(0xFFE94057),
                                shape: BoxShape.circle
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Image.asset("assets/images/feather-video.png", color: Colors.white,),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            //photo message
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color(0xFFE94057),
                                shape: BoxShape.circle
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Image.asset("assets/images/feather_camera.png", color: Colors.white,),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: demoUsers.length,
                          itemBuilder: (context, index) {
                            return MessageUserStyle(userImage: demoUsers[Random().nextInt(demoUsers.length)]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
