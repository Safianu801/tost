import 'package:flutter/material.dart';
import 'package:toast_mobile/features/settings/screens/security_settings_screen.dart';
import 'package:toast_mobile/features/settings/screens/system_preference.dart';
import 'package:toast_mobile/features/settings/screens/terms_and_privacy.dart';

import '../../../utilities/custom_back_navigator.dart';
import '../components/settings_components.dart';
import 'help_center.dart';
import 'notifications_Settings_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackNavigator(onPress: () {
          Navigator.pop(context);
        }),
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 380,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SettingsComponents(
                        settingsTitle: "Help Center", onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HelpCenter()));}, imageIcon: "shield.png",),
                    SettingsComponents(
                        settingsTitle: "Terms & Policy", onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TermsAndPrivacy()));}, imageIcon: 'setting-config.png',),
                    SettingsComponents(
                        settingsTitle: "Security", onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SecuritySettingsScreen()));}, imageIcon: 'shield.png',),
                    SettingsComponents(
                        settingsTitle: "System Preference",
                        onPress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SystemPreference()));
                        }, imageIcon: 'shield.png',),
                    SettingsComponents(
                      settingsTitle: "Notification",
                      onPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const NotificationsSettingsScreen()));
                      },
                      label: "On", imageIcon: 'messages-3.png',
                    ),
                    SettingsComponents(
                        settingsTitle: "Language", onPress: () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Default language is set at English")));
                    }, imageIcon: 'global.png',),
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
