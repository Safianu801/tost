import 'package:flutter/material.dart';
import 'package:toast_mobile/features/settings/screens/privacy_policy.dart';
import 'package:toast_mobile/features/settings/screens/terms_of_use_screen.dart';

import '../../../utilities/custom_back_navigator.dart';
import '../components/settings_components.dart';

class TermsAndPrivacy extends StatefulWidget {
  const TermsAndPrivacy({super.key});

  @override
  State<TermsAndPrivacy> createState() => _TermsAndPrivacyState();
}

class _TermsAndPrivacyState extends State<TermsAndPrivacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackNavigator(onPress: () {
          Navigator.pop(context);
        }),
        title: const Text("Terms & Policy"),
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
                  border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SettingsComponents(
                        settingsTitle: "Terms of Use", onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TermsOfUseScreen()));}, imageIcon: 'messages-3.png',),
                    SettingsComponents(
                      settingsTitle: "Privacy Policy",
                      onPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PrivacyPolicy()));
                      },
                      label: "On", imageIcon: 'viencharts.png',
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
