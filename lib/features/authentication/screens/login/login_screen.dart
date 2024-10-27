import 'package:flutter/material.dart';

import '../../../../services/authentication_service.dart';
import '../../../../utilities/custom_button_two.dart';
import '../../../../utilities/custom_loader.dart';
import '../../../../utilities/text_space.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;
  final AuthenticationService _authenticationService = AuthenticationService();
  Future<void> _performLogin() async {
    setState(() {
      _isLoading = true;
    });
    try {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      await _authenticationService.userLogin(context, email, password,);
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      print(err);
    }
  }
  bool isChecked = false;
  bool passwordCheck = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hi, Welcome Back! 👋",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25
                      ),
                    ),
                    const Text(
                      "Hello again, we’ve missed you!",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey
                      ),
                    ),
                    const SizedBox(height: 25,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(
                              color: Color(0xFFE94057),
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        TextSpace(obscureText: false, controller: emailController, hintText: "example@gmail.com", prefixIcon: null, suffixIcon: null)
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Password",
                          style: TextStyle(
                              color: Color(0xFFE94057),
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        TextSpace(
                          obscureText: passwordCheck ? false : true,
                          controller: passwordController,
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
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              },
                              child: Container(
                                height: 17,
                                width: 17,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: isChecked ? const Color(0xFFE94057) : Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                    color: isChecked ? const Color(0xFFE94057) : Colors.transparent
                                ),
                                child: Center(
                                  child: isChecked ? const Icon(Icons.check, size: 12, color: Colors.white,) : null,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5,),
                            RichText(
                              text: const TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Remember Me",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13
                                        )
                                    ),
                                  ]
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ForgetPasswordScreen()));
                          },
                          child: RichText(
                            text: const TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Forgot Password",
                                      style: TextStyle(
                                          color: Color(0xFFE94057),
                                          decorationColor: Color(0xFFE94057),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500
                                      )
                                  ),

                                ]
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 50,),
                    CustomButtonTwo(title: "Login", onPress: (){
                      if (emailController.text.trim().isNotEmpty && passwordController.text.trim().isNotEmpty) {
                        _performLogin();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("All entries are required")));
                      }
                    }),
                    const SizedBox(height: 20,),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: RichText(
                          text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: "Don't have an account? ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13
                                    )
                                ),
                                TextSpan(
                                    text: "SignUp",
                                    style: TextStyle(
                                        color: Color(0xFFE94057),
                                        decorationColor: Color(0xFFE94057),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500
                                    )
                                ),

                              ]
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        if (_isLoading) const CustomLoaderOverlay()
      ],
    );
  }
}
