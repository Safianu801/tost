import 'dart:math';

import 'package:flutter/material.dart';

import '../../settings/screens/settings_screen.dart';
import '../component/home_image_component_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFE6EB),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFE6EB),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset("assets/svgs/app_logo.png"),
            ),
          ),
          actions: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13)
              ),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Center(child: Image.asset(
                  "assets/images/notification-filled.png",
                  color: const Color(0xFFDC143C),)),
              ),
            ),
            const SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
              },
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Center(child: Image.asset(
                    "assets/images/ios_settings.png", color: const Color(0xFFDC143C),)),
                ),
              ),
            ),
            const SizedBox(width: 10,),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: SizedBox(
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 1,
                          mainAxisExtent: 120,
                          mainAxisSpacing: 2,
                          crossAxisCount: 3),
                      itemCount: demoUsers.length,
                      itemBuilder: (context, index) {
                        return HomeImageComponentStyle(image: demoUsers[Random().nextInt(demoUsers.length)]);
                      }
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Expanded(
                flex: 4,
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: demoUsers.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HomeImageComponentStyle(
                        image: demoUsers[Random().nextInt(demoUsers.length)],);
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFFFFE6EB)
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
