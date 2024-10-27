import 'package:flutter/material.dart';
import 'package:toast_mobile/features/authentication/screens/login/reset_password_emil_verification_screen.dart';

import '../../../../utilities/custom_button_two.dart';
import '../../../../utilities/text_space.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();

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
              "Forgot Password",
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
                  "Please enter your current email address",
                  style: TextStyle(
                      color: Color(0xFFE94057),
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
                TextSpace(
                  obscureText: false,
                  controller: emailController,
                  hintText: "useremail@gmail.com",
                  prefixIcon: null,
                  suffixIcon: null
                ),
              ],
            ),
            const SizedBox(height: 50,),
            CustomButtonTwo(title: "Reset Password", onPress: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ResetPasswordEmailVerification()));
            })
          ],
        ),
      ),
    );
  }
}
