import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utilities/custom_back_navigator.dart';

class TwoStepVerification extends StatefulWidget {
  const TwoStepVerification({super.key});

  @override
  State<TwoStepVerification> createState() => _TwoStepVerificationState();
}

class _TwoStepVerificationState extends State<TwoStepVerification> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: CustomBackNavigator(onPress: (){
            Navigator.pop(context);
          }),
          title: const Text("Two Step Verification")
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Two-Step Verifcation",
                  style: TextStyle(
                      fontSize: 17
                  ),
                ),
                CupertinoSwitch(
                  activeColor: Colors.redAccent,
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
