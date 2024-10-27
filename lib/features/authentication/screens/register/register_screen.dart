import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../services/authentication_service.dart';
import '../../../../utilities/custom_button_two.dart';
import '../../../../utilities/custom_loader.dart';
import '../../../../utilities/text_space.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading = false;
  final AuthenticationService _authenticationService = AuthenticationService();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordValid() {
    // Password criteria checks
    bool hasMinLength = passwordController.text.length >= 6;
    bool hasDigits = RegExp(r'\d').hasMatch(passwordController.text);
    bool hasUpperCase = RegExp(r'[A-Z]').hasMatch(passwordController.text);
    bool hasLowerCase = RegExp(r'[a-z]').hasMatch(passwordController.text);
    bool hasSymbols =
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(passwordController.text);

    return hasMinLength &&
        hasDigits &&
        hasUpperCase &&
        hasLowerCase &&
        hasSymbols;
  }

  Future<void> _performRegistration() async {
    setState(() {
      _isLoading = true;
    });
    try {
      String firstName = firstNameController.text.trim();
      String lastName = lastNameController.text.trim();
      String email = emailController.text.trim();
      String phone = phoneNumberController.text.trim();
      String password = passwordController.text.trim();

      await _authenticationService.registerUser(
        context,
        firstName,
        lastName,
        email,
        phone,
        password,
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      if (kDebugMode) {
        print(err);
      }
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
                      "Create an account",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                    ),
                    const Text(
                      "Hi, your’e welcome!",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "First Name",
                              style: TextStyle(
                                  color: Color(0xFFE94057),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpace(
                                obscureText: false,
                                controller: firstNameController,
                                hintText: "First Name",
                                prefixIcon: null,
                                suffixIcon: null)
                          ],
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Last Name",
                              style: TextStyle(
                                  color: Color(0xFFE94057),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpace(
                                obscureText: false,
                                controller: lastNameController,
                                hintText: "Last Name",
                                prefixIcon: null,
                                suffixIcon: null)
                          ],
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Email Address",
                          style: TextStyle(
                              color: Color(0xFFE94057),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpace(
                          obscureText: false,
                          controller: emailController,
                          hintText: "example@gmail.com",
                          prefixIcon: null,
                          suffixIcon: null,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Phone Number",
                          style: TextStyle(
                              color: Color(0xFFE94057),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color(0xFFEBEBEB),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Center(
                                      child: Text(
                                        "+234",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                flex: 14,
                                child: TextSpace(
                                    obscureText: false,
                                    controller: phoneNumberController,
                                    hintText: "phone number",
                                    prefixIcon: null,
                                    suffixIcon: null)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Password",
                          style: TextStyle(
                              color: Color(0xFFE94057),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpace(
                          obscureText: passwordCheck ? false : true,
                          controller: passwordController,
                          hintText: "Enter password",
                          prefixIcon: null,
                          onChange: (value) {
                            setState(() {});
                          },
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
                        const SizedBox(
                          height: 10,
                        ),
                        StrongPasswordCheck(
                          title: "6 characters and above",
                          isValid: passwordController.text.length >= 6,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        StrongPasswordCheck(
                          title: "use of number",
                          isValid:
                              RegExp(r'\d').hasMatch(passwordController.text),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        StrongPasswordCheck(
                          title: "use of capital letter",
                          isValid: RegExp(r'[A-Z]')
                              .hasMatch(passwordController.text),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        StrongPasswordCheck(
                          title: "use of small letter",
                          isValid: RegExp(r'[a-z]')
                              .hasMatch(passwordController.text),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        StrongPasswordCheck(
                          title: "use of symbol",
                          isValid: RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                              .hasMatch(passwordController.text),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButtonTwo(
                      title: "Sign Up",
                      onPress: () {
                        if (firstNameController.text.trim().isNotEmpty &&
                            lastNameController.text.trim().isNotEmpty &&
                            emailController.text.trim().isNotEmpty &&
                            phoneNumberController.text.trim().isNotEmpty &&
                            passwordController.text.trim().isNotEmpty &&
                            isChecked == true) {
                          _performRegistration();
                        } else if (firstNameController.text.trim().isNotEmpty &&
                            lastNameController.text.trim().isNotEmpty &&
                            emailController.text.trim().isNotEmpty &&
                            phoneNumberController.text.trim().isNotEmpty &&
                            passwordController.text.trim().isNotEmpty &&
                            isChecked == false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Agree to our terms of service")));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("All entries are required")));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: Container(
                            height: 17,
                            width: 17,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: isChecked
                                        ? const Color(0xFFE94057)
                                        : Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                                color: isChecked
                                    ? const Color(0xFFE94057)
                                    : Colors.transparent),
                            child: Center(
                              child: isChecked
                                  ? const Icon(
                                      Icons.check,
                                      size: 12,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                                text: "I agree to the ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13)),
                            TextSpan(
                                text: "terms of service",
                                style: TextStyle(
                                    color: Color(0xFFE94057),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFE94057),
                                    fontSize: 13)),
                            TextSpan(
                                text: " and ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13)),
                            TextSpan(
                                text: "privacy policy",
                                style: TextStyle(
                                    color: Color(0xFFE94057),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFE94057),
                                    fontSize: 13)),
                          ]),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                        },
                        child: RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13)),
                            TextSpan(
                                text: "Login",
                                style: TextStyle(
                                    color: Color(0xFFE94057),
                                    decorationColor: Color(0xFFE94057),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500)),
                          ]),
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

class StrongPasswordCheck extends StatelessWidget {
  final String title;
  final bool isValid;

  const StrongPasswordCheck({
    Key? key,
    required this.title,
    required this.isValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            color: isValid ? const Color(0xFFE94057) : Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              isValid ? Icons.check : Icons.close,
              size: 9,
              color: isValid ? Colors.white : Colors.black.withOpacity(0.2),
            ),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: isValid ? Colors.black : Colors.grey[300],
          ),
        )
      ],
    );
  }
}
