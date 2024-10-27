import 'package:flutter/material.dart';

import '../../../../utilities/custom_button_two.dart';
import '../../../../utilities/text_space.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool passwordCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Change Password",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "New Password",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
                TextSpace(
                  obscureText: passwordCheck ? false : true,
                  controller: newPasswordController,
                  hintText: "Enter password",
                  prefixIcon: null,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordCheck = !passwordCheck;
                      });
                    },
                    icon: Image.asset(
                      passwordCheck
                          ? "assets/images/feather_eye.png"
                          : "assets/images/feather_eye_off.png",
                      scale: 4,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Re-enter New Password",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
                TextSpace(
                  obscureText: passwordCheck ? false : true,
                  controller: confirmPasswordController,
                  hintText: "Enter password",
                  prefixIcon: null,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordCheck = !passwordCheck;
                      });
                    },
                    icon: Image.asset(
                      passwordCheck
                          ? "assets/images/feather_eye.png"
                          : "assets/images/feather_eye_off.png",
                      scale: 4,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomButtonTwo(title: "Save", onPress: (){}),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
