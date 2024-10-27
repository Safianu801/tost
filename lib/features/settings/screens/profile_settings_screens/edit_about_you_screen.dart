import 'package:flutter/material.dart';
import '../../../../utilities/custom_back_navigator.dart';
import '../../../../utilities/custom_button_one.dart';
import '../../../../utilities/large_text_space.dart';

class EditAboutYouScreen extends StatefulWidget {
  const EditAboutYouScreen({super.key});

  @override
  State<EditAboutYouScreen> createState() => _EditAboutYouScreenState();
}

class _EditAboutYouScreenState extends State<EditAboutYouScreen> {
  final aboutYouController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackNavigator(onPress: () {
          Navigator.pop(context);
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "About",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              LargeTextSpace(
                  controller: aboutYouController,
                  hintText: "about you",
                  obscureText: false),
              const SizedBox(height: 55,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/8.0),
                child: CustomButtonOne(title: "SAVE", onPress: (){}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
