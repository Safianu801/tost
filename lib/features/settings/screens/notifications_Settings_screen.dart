import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utilities/custom_back_navigator.dart';

class NotificationsSettingsScreen extends StatefulWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  State<NotificationsSettingsScreen> createState() => _NotificationsSettingsScreenState();
}

class _NotificationsSettingsScreenState extends State<NotificationsSettingsScreen> {
  bool _inAppNotification = false;
  bool _emailNotification = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: CustomBackNavigator(onPress: (){
            Navigator.pop(context);
          }),
          title: const Text("Notification")
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "In-app Notification",
                  style: TextStyle(
                      fontSize: 17
                  ),
                ),
                CupertinoSwitch(
                  activeColor: Colors.redAccent,
                  value: _inAppNotification,
                  onChanged: (value) {
                    setState(() {
                      _inAppNotification = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Email Notification",
                  style: TextStyle(
                      fontSize: 17
                  ),
                ),
                CupertinoSwitch(
                  activeColor: Colors.redAccent,
                  value: _emailNotification,
                  onChanged: (value) {
                    setState(() {
                      _emailNotification = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
