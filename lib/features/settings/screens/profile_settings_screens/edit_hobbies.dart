import 'package:flutter/material.dart';
import '../../../../utilities/custom_back_navigator.dart';
import '../../../../utilities/custom_button_one.dart';
import '../../components/card_selector.dart';

class EditHobbies extends StatefulWidget {
  const EditHobbies({super.key});

  @override
  State<EditHobbies> createState() => _EditHobbiesState();
}

class _EditHobbiesState extends State<EditHobbies> {
  List<String> selectedHobbies = [];
  // Function to toggle selection
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
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 9),
            child: Column(
              children: [
                Row(
                  children: [
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
                        const SizedBox(width: 10,),
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
                    const SizedBox(width: 10,),
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
                        const SizedBox(width: 10,),
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
                    const SizedBox(width: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: CardSelector(
                            title: 'Cooking',
                            icon: '🍳',
                            isSelected: selectedHobbies.contains('Cooking'),
                            onTap: () => toggleSelection('Cooking'),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: CardSelector(
                            title: 'Tennis',
                            icon: '🎾',
                            isSelected: selectedHobbies.contains('Tennis'),
                            onTap: () => toggleSelection('Tennis'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: CardSelector(
                            title: 'Run',
                            icon: '🏃',
                            isSelected: selectedHobbies.contains('Run'),
                            onTap: () => toggleSelection('Run'),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: CardSelector(
                            title: 'Swimming',
                            icon: '🤽‍♂',
                            isSelected: selectedHobbies.contains('Swimming'),
                            onTap: () => toggleSelection('Swimming'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: CardSelector(
                            title: 'Art',
                            icon: '🎨',
                            isSelected: selectedHobbies.contains('Art'),
                            onTap: () => toggleSelection('Art'),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: CardSelector(
                            title: 'Traveling',
                            icon: '✈',
                            isSelected: selectedHobbies.contains('Traveling'),
                            onTap: () => toggleSelection('Traveling'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: CardSelector(
                            title: 'Extreme',
                            icon: '🙌',
                            isSelected: selectedHobbies.contains('Extreme'),
                            onTap: () => toggleSelection('Extreme'),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: CardSelector(
                            title: 'Music',
                            icon: '🎸',
                            isSelected: selectedHobbies.contains('Music'),
                            onTap: () => toggleSelection('Music'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: CardSelector(
                            title: 'Drink',
                            icon: '🥂',
                            isSelected: selectedHobbies.contains('Drink'),
                            onTap: () => toggleSelection('Drink'),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: CardSelector(
                            title: 'Video games',
                            icon: '🎮',
                            isSelected: selectedHobbies.contains('Video games'),
                            onTap: () => toggleSelection('Video games'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50,),
                CustomButtonOne(
                  title: "Save",
                  onPress: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
