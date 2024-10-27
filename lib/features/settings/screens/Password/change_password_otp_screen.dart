import 'package:flutter/material.dart';
import '../../../../services/authentication_service.dart';
import '../../../../utilities/custom_back_navigator.dart';
import '../../../../utilities/custom_button_one.dart';

class ChangePasswordOTPVerification extends StatefulWidget {
  final String email;
  final String password;
  const ChangePasswordOTPVerification({super.key, required this.email, required this.password});

  @override
  State<ChangePasswordOTPVerification> createState() => _ChangePasswordOTPVerificationState();
}

class _ChangePasswordOTPVerificationState extends State<ChangePasswordOTPVerification> {
  bool isLoading = false;
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());
  final List<ValueNotifier<bool>> _inputStatus = List.generate(4, (index) => ValueNotifier(false));
  AuthenticationService authenticationService = AuthenticationService();

  @override
  void initState() {
    super.initState();
    authenticationService.resetPassword(context, widget.email);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }
  void _updatePassword(BuildContext context, int otp, String email, String password ) async {
    try {
      setState(() {
        isLoading = true;
      });
      await authenticationService.updatePassword(context, otp, email, password);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }
  @override
  void dispose() {
    _focusNodes.forEach((node) => node.dispose());
    _controllers.forEach((controller) => controller.dispose());
    _inputStatus.forEach((notifier) => notifier.dispose());
    super.dispose();
  }

  void _nextField(String value, int index) {
    _inputStatus[index].value = value.isNotEmpty;
    if (value.length == 1) {
      if (index < _focusNodes.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }
  }

  String _getOTP() {
    String otp = '';
    for (var controller in _controllers) {
      otp += controller.text;
    }
    return otp;
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
        children: [
          const Text(
            "Very Code",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 10,),
          const Text(
            "Enter 4-digit code",
            style: TextStyle(
                color: Color(0xFFE94057)
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: SizedBox(
                        width: 60,
                        child: ValueListenableBuilder(
                          valueListenable: _inputStatus[index],
                          builder: (context, hasInput, child) {
                            return TextField(
                              controller: _controllers[index],
                              focusNode: _focusNodes[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              onChanged: (value) => _nextField(value, index),
                              style: TextStyle(
                                  color: hasInput ? Colors.white : Colors.black,
                                  fontSize: 20
                              ),
                              decoration: InputDecoration(
                                counterText: '',
                                border: const OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: hasInput ? const Color(0xFFE94057) : Colors.grey),
                                    borderRadius: BorderRadius.circular(18)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: hasInput ? const Color(0xFFE94057) : Colors.grey),
                                    borderRadius: BorderRadius.circular(18)
                                ),
                                filled: true,
                                fillColor: hasInput ? const Color(0xFFE94057) : Colors.transparent,
                              ),
                            );
                          },
                        ),
                      )
                  );
                }),
              ),
            ),
          ),
          const Text(
            "01:45",
            style: TextStyle(
                color: Color(0xFFE94057),
                fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 50,),
          CustomButtonOne(title: "Update", onPress: () {
            String otp = _getOTP();
            _updatePassword(context, int.parse(otp), widget.email, widget.password);
          }),
          const Spacer(),
          const Text(
            "Didn't receive code",
            style: TextStyle(
                fontSize: 13,
                color: Colors.black
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: RichText(
                text: const TextSpan(
                    children: [
                      TextSpan(
                          text: "Resend",
                          style: TextStyle(
                              color: Color(0xFFE94057),
                              decorationColor: Color(0xFFE94057),
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          )
                      ),
                      TextSpan(
                          text: " in ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13
                          )
                      ),
                      TextSpan(
                          text: "30 ",
                          style: TextStyle(
                              color: Color(0xFFE94057),
                              decorationColor: Color(0xFFE94057),
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          )
                      ),
                      TextSpan(
                          text: "second(s)",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13
                          )
                      ),

                    ]
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}
