import 'package:flutter/material.dart';

import '../../../../utilities/custom_back_navigator.dart';
import '../../../../utilities/custom_button_one.dart';
import '../../components/card_selector.dart';
import 'location_range_screen.dart';

class HobbiesScreen extends StatefulWidget {
  final String userGender;
  final String userAge;

  const HobbiesScreen(
      {Key? key, required this.userGender, required this.userAge})
      : super(key: key);

  @override
  State<HobbiesScreen> createState() => _HobbiesScreenState();
}

class _HobbiesScreenState extends State<HobbiesScreen> {
  List<String> selectedHobbies = [];

  void toggleSelection(String hobby) {
    setState(() {
      if (selectedHobbies.contains(hobby)) {
        selectedHobbies.remove(hobby);
      } else {
        if (selectedHobbies.length < 6) {
          selectedHobbies.add(hobby);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackNavigator(
          onPress: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                const Text(
                  "Hobbies",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: [
                    TextSpan(
                      text: "You are only allowed to pick out",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: " 6 ",
                      style: TextStyle(
                        color: Color(0xFFE94057),
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: "out \nof the list",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 9),
            child: Column(
              children: [
                // Hobby selections in rows
                Row(
                  children: [
                    Expanded(
                      child: CardSelector(
                        title: 'Photography',
                        icon: '📷',
                        isSelected: selectedHobbies.contains('Photography'),
                        onTap: () => toggleSelection('Photography'),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CardSelector(
                        title: 'Shopping',
                        icon: '👗',
                        isSelected: selectedHobbies.contains('Shopping'),
                        onTap: () => toggleSelection('Shopping'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    Expanded(
                      child: CardSelector(
                        title: 'Karaoke',
                        icon: '🥋',
                        isSelected: selectedHobbies.contains('Karaoke'),
                        onTap: () => toggleSelection('Karaoke'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CardSelector(
                        title: 'Yoga',
                        icon: '🧘',
                        isSelected: selectedHobbies.contains('Yoga'),
                        onTap: () => toggleSelection('Yoga'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                CustomButtonOne(
                  title: "NEXT",
                  onPress: () {
                    if (selectedHobbies.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Select at least one from the categories")));
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LocationRangeScreen(
                            userGender: widget.userGender,
                            userAge: widget.userAge,
                            hobbies: selectedHobbies,  // Pass hobbies to the next screen
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
