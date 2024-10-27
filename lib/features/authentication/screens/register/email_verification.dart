import 'package:flutter/material.dart';
import 'package:toast_mobile/features/authentication/screens/register/phone_verification.dart';

import '../../../../services/authentication_service.dart';
import '../../../../utilities/custom_back_navigator.dart';
import '../../../../utilities/custom_button_one.dart';

class EmailVerification extends StatefulWidget {
  final String email;
  const EmailVerification({super.key, required this.email});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  AuthenticationService authenticationService = AuthenticationService();
  @override
  void initState() {
    super.initState();
  }
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
                "Account Verification",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ),
              ),
              const Text(
                  "Please verify your account using the link sent to",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10,),
              Text(
                widget.email,
                style: const TextStyle(
                    color: Color(0xFFE94057),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFE94057)
                ),
              ),
              const SizedBox(height: 30,),
              CustomButtonOne(title: "PROCEED", onPress: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PhoneVerification()));
              }),
            ],
          ),
          const Spacer(),
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
