import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../services/user_provider.dart';
import '../../../../utilities/custom_back_navigator.dart';
import '../../../../utilities/custom_button_two.dart';
import '../../../../utilities/text_space.dart';
import 'change_password_otp_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  bool passwordCheck = false;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).profile;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackNavigator(onPress: (){
          Navigator.pop(context);
        }),
        title: const Text("Change Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Old Password",
                  style: TextStyle(
                      color: Color(0xFFE94057),
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
                TextSpace(
                  obscureText: passwordCheck ? false : true,
                  controller: oldPasswordController,
                  hintText: "Enter old Password",
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
                  "New Password",
                  style: TextStyle(
                      color: Color(0xFFE94057),
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
                TextSpace(
                  obscureText: passwordCheck ? false : true,
                  controller: newPasswordController,
                  hintText: "Enter New Password",
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
                  "Confirm New Password",
                  style: TextStyle(
                      color: Color(0xFFE94057),
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
                TextSpace(
                  obscureText: passwordCheck ? false : true,
                  controller: confirmNewPasswordController,
                  hintText: "Confirm New Password",
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
            const SizedBox(height: 50,),
            CustomButtonTwo(title: "Next", onPress: (){
              if (oldPasswordController.text.trim().isNotEmpty && newPasswordController.text.trim().isNotEmpty && confirmNewPasswordController.text.trim().isNotEmpty) {
                if (newPasswordController.text.trim().isNotEmpty == confirmNewPasswordController.text.trim().isNotEmpty) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePasswordOTPVerification(email: user.email, password: newPasswordController.text.trim())));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Missing match")));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Missing Field")));
              }
            })
          ],
        ),
      ),
    );
  }
}
