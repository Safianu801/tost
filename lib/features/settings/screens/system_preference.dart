import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utilities/custom_back_navigator.dart';

class SystemPreference extends StatefulWidget {
  const SystemPreference({super.key});

  @override
  State<SystemPreference> createState() => _SystemPreferenceState();
}

class _SystemPreferenceState extends State<SystemPreference> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackNavigator(onPress: (){
          Navigator.pop(context);
        }),
        title: const Text("System Preference")
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Dark Mode",
                  style: TextStyle(
                    fontSize: 17
                  ),
                ),
                CupertinoSwitch(
                  activeColor: Colors.redAccent,
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
