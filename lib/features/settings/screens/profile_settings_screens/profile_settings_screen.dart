import 'package:flutter/material.dart';
import '../../../../utilities/custom_back_navigator.dart';
import '../../components/settings_components.dart';
import 'edit_about_you_screen.dart';
import 'edit_hobbies.dart';
import 'edit_location.dart';
import 'edit_profile_photos.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
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
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SettingsComponents(
                        settingsTitle: "Edit Photos", onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EditProfilePhotos()));}, imageIcon: 'feather-user-check.png',),
                    SettingsComponents(
                        settingsTitle: "Edit About You", onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EditAboutYouScreen()));}, imageIcon: 'feather_edit_3.png',),
                    SettingsComponents(
                        settingsTitle: "Edit Hobbies", onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EditHobbies()));}, imageIcon: 'dashboard_filled.png',),
                    SettingsComponents(
                        settingsTitle: "Edit Location",
                        onPress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const EditLocation()));
                        }, imageIcon: 'map-marker-filled.png',),
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
