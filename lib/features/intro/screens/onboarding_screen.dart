import 'package:flutter/material.dart';

import '../../../utilities/custom_button_one.dart';
import '../../../utilities/custom_dot_indicator.dart';
import '../../authentication/screens/register/register_screen.dart';
import '../componenets/intro_item_style.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List introImage = [
    "img_rectangle_26.png",
    "img_rectangle_26_348x348.png",
    "img_rectangle_27.png"
  ];
  List introTitle = [
    "MEET NEW FRIENDS",
    "CHAT WITH EASE",
    "FIND A MATCH",
  ];
  List introSubMessage = [
    "Step into a world of new friends, where you can connect with people from all walks of life, build strong bonds, and enrich your social circle with meaningful relationship.",
    "Experience meaningful connection by exploring shared interest, and build bonds that have the potential to grow into a deep relationship with our features.",
    "Match with like-minded individuals who share your passion and interest, creating a strong foundation for genuine and lasting bond.",
  ];
  int currentIntro = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onIntroSelected(int index) {
    setState(() {
      currentIntro = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD8E0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD8E0),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegisterScreen()));
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Color(0xFFF38293)),
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 14,
            child: SizedBox(
              child: PageView.builder(
                itemCount: introImage.length,
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: onIntroSelected,
                itemBuilder: (BuildContext context, int index) {
                  return IntroItemStyle(
                    introImage: introImage[index],
                    introTitle: introTitle[index],
                    introSubMessage: introSubMessage[index],
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < introImage.length; i++)
                              if (currentIntro == i)
                                const CustomDotIndicator(
                                  isIndex: true,
                                  activeColor: Color(0xFFEE576C),
                                )
                              else
                                const CustomDotIndicator(
                                  isIndex: false,
                                  activeColor: Color(0xFFD9D9D9),
                                )
                          ],
                        ),
                      ),
                      if (currentIntro == 2)
                        Center(
                            child: CustomButtonOne(
                          title: "GET STARTED",
                          onPress: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()),
                                (route) => false);
                          },
                        ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
