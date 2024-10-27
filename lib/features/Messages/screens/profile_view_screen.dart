import 'dart:math';

import 'package:flutter/material.dart';

import '../../../utilities/read_more_text.dart';
import '../../../utilities/text_space.dart';

class ProfileViewScreen extends StatefulWidget {
  final String userImage;

  const ProfileViewScreen({super.key, required this.userImage});

  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen> {
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
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            children: [
              Container(
                height: 390,
                width: MediaQuery.of(context).size.width,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Stack(
                  children: [
                    Container(
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Image.asset(
                        "assets/images/${widget.userImage}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 40),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                            ),
                            Container(
                              height: 90,
                              width: 90,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFE94057),
                                  shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Image.asset(
                                  "assets/images/heart_filled.png",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.purple,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Brenda25",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    "Professional model",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Chicago. L United State",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.red,
                              ),
                              Text(
                                "1km",
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "About",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const ReadMoreText(
                    longText:
                        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                    maxLength: 300,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Hobbies",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1,
                                crossAxisSpacing: 5,
                                mainAxisExtent: 35,
                                mainAxisSpacing: 10),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1,
                                    color: Colors.grey.withOpacity(0.4))),
                            child: const Center(
                              child: Text("Hobbies text"),
                            ),
                          );
                        }),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hobbies",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "see all",
                        style: TextStyle(color: Colors.redAccent),
                      )
                    ],
                  ),
                  SizedBox(
                      height: 340,
                      child: Stack(
                        children: [
                          GridView.builder(
                              itemCount: 4,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Image.asset(
                                      "assets/images/${demoUsers[Random().nextInt(demoUsers.length)]}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.0)
                            ),
                          ),
                        ],
                      )
                  ),
                  TextSpace(obscureText: false, controller: phoneNumberController, hintText: "+234XXXXXXXXXX", prefixIcon: const Icon(Icons.phone), suffixIcon: null),
                  const SizedBox(height: 100,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
