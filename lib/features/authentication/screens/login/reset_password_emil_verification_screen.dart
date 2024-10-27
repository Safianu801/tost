import 'package:flutter/material.dart';
import 'package:toast_mobile/features/authentication/screens/login/reset_password_otp_verification.dart';

import '../../../../utilities/custom_back_navigator.dart';
import '../../../../utilities/custom_button_one.dart';

class ResetPasswordEmailVerification extends StatefulWidget {
  const ResetPasswordEmailVerification({super.key});

  @override
  State<ResetPasswordEmailVerification> createState() => _ResetPasswordEmailVerificationState();
}

class _ResetPasswordEmailVerificationState extends State<ResetPasswordEmailVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackNavigator(onPress: (){
          Navigator.pop(context);
        }),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 270,
                  width: 300,
                  child: Image.asset("assets/images/mail_group.png"),
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                "Please reset your password using the link sent to you",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10,),
              const Text(
                "userEmail@.gmail.com",
                style: TextStyle(
                    color: Color(0xFFE94057),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFE94057)
                ),
              ),
              const SizedBox(height: 30,),
              CustomButtonOne(title: "NEXT", onPress: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ResetPasswordOTPVerification()));
              }),
            ],
          ),
          Spacer(),
          const Text(
            "Didn't receive email?",
            style: TextStyle(
                fontSize: 17
            ),
          ),
          InkWell(
            onTap: (){},
            child: const Text(
              "Resend",
              style: TextStyle(
                  color: Color(0xFFE94057),
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFFE94057)
              ),
            ),
          )
        ],
      ),
    );
  }
}
