import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), (){
      final navigator = Navigator.of(context);
      navigator.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const OnBoardingScreen()), (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEE576C),
        body: Stack(
          children: [
            Center(
              child: Image.asset("assets/images/img_ellipse_3.png"),
            ),
            Center(
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.3, color: Colors.white),
                    shape: BoxShape.circle
                ),
              ),
            ),
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.3, color: Colors.white),
                  shape: BoxShape.circle
                ),
                child: Center(
                  child: Image.asset("assets/svgs/app_logo1.png"),
                ),
              ),
            ),
            Positioned( top: 130, left: 50, child: SizedBox( height: 60, width: 60,child: Image.asset("assets/images/img_ellipse_4.png"))),
            Positioned(top: 185, right: 50,child: SizedBox( height: 90, width: 90,child: Image.asset("assets/images/img_ellipse_5.png"))),
            Positioned(top: 300, left: -26,child: SizedBox( height: 70, width: 90,child: Image.asset("assets/images/img_ellipse_6.png"))),
            Positioned(bottom: 130, left: 20,child: SizedBox( height: 80, width: 80,child: Image.asset("assets/images/img_ellipse_7.png"))),
            Positioned(bottom: 170, right: -16,child: SizedBox( height: 70, width: 70,child: Image.asset("assets/images/img_ellipse_8.png"))),
            Positioned( bottom: 350, right: 60,child: SizedBox( height: 50, width: 50,child: Image.asset("assets/images/img_ellipse_9.png"))),
          ],
        ));
  }
}
