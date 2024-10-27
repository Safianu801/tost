import 'dart:math';

import 'package:flutter/material.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
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
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isClicked ? "Likes" : "Matches",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isClicked = !isClicked;
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: Center(
                            child: Icon(
                              isClicked ? Icons.close : Icons.share,
                              size: 18,
                              color: const Color(0xFFE94057),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                isClicked ? "This is a list of people who have liked you and your matches" : "Choose if you want to match with this people",
                style: const TextStyle(color: Colors.grey),
              ),
              isClicked ? Expanded(
                child: GridView.builder(
                    itemCount: 10,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          width: 100,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Image.asset("assets/images/${demoUsers[Random().nextInt(demoUsers.length)]}", fit: BoxFit.cover,),
                        ),
                      );
                    }),
              ) : Expanded(
                child: GridView.builder(
                  itemCount: 4,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          width: 100,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Image.asset("assets/images/${demoUsers[Random().nextInt(demoUsers.length)]}", fit: BoxFit.cover,),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
