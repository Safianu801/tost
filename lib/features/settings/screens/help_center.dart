import 'package:flutter/material.dart';

import '../../../utilities/custom_back_navigator.dart';
import '../../../utilities/text_space.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  final searchHelpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackNavigator(onPress: (){Navigator.pop(context);},),
        title: const Text("Help Center"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hi, how can we help you?",
                  style: TextStyle(
                      color: Color(0xFFE94057),
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
                TextSpace(obscureText: false, controller: searchHelpController, hintText: "Search", prefixIcon: null, suffixIcon: null)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
