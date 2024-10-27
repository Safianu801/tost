import 'package:flutter/material.dart';
import 'package:toast_mobile/features/settings/screens/two_step_verification.dart';

import '../../../utilities/custom_back_navigator.dart';
import '../components/settings_components.dart';
import 'Password/change_password_screen.dart';

class SecuritySettingsScreen extends StatefulWidget {
  const SecuritySettingsScreen({super.key});

  @override
  State<SecuritySettingsScreen> createState() => _SecuritySettingsScreenState();
}

class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackNavigator(onPress: () {
          Navigator.pop(context);
        }),
        title: const Text("Security"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SettingsComponents(
                        settingsTitle: "Change Password", onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ChangePasswordScreen()));}, imageIcon: 'setting-config.png',),
                    SettingsComponents(
                      settingsTitle: "Two-Step Verification",
                      onPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const TwoStepVerification()));
                      },
                      label: "On", imageIcon: 'shield.png',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
