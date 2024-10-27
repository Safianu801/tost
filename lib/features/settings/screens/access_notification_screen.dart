import 'package:flutter/material.dart';
import '../../../utilities/custom_back_navigator.dart';
import '../../../utilities/cutom_button_three.dart';
import '../../intro/screens/welcome_screen.dart';

class AccessNotification extends StatefulWidget {
  const AccessNotification({super.key});

  @override
  State<AccessNotification> createState() => _AccessNotificationState();
}

class _AccessNotificationState extends State<AccessNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackNavigator(onPress: (){
          Navigator.pop(context);
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "Access notification",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            const SizedBox(height: 50,),
            Center(
              child: SizedBox(
                height: 250,
                width: 250,
                child: Center(
                  child: Image.asset("assets/images/img_chat.png"),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const Center(
              child: Text(
                "Enable notifications",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            const Center(
              child: Text(
                "Get push-notifications when you get the\nmatch or receive a message",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  color: Colors.grey
                ),
              ),
            ),
            const SizedBox(height: 55,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/8.0),
              child: CustomButtonThree(title: "Enable", onPress: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WelcomeScreen()));
              }),
            )
          ],
        ),
      ),
    );
  }
}
