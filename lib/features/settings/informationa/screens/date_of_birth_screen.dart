import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utilities/custom_back_navigator.dart';
import '../../../../utilities/custom_button_one.dart';
import '../../../../utilities/cutom_button_three.dart';
import 'hobbies_screen.dart';

class DateOfBirthScreen extends StatefulWidget {
  final String userGender;
  const DateOfBirthScreen({super.key, required this.userGender});

  @override
  State<DateOfBirthScreen> createState() => _DateOfBirthScreenState();
}

class _DateOfBirthScreenState extends State<DateOfBirthScreen> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String userAge = "${_selectedDate.year}/${_selectedDate.day}/${_selectedDate.month}";
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackNavigator(onPress: () {
          Navigator.pop(context);
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const Text(
              "Date of Birth",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const Text(
              "Your date of birth wont be shown on \nyour profile",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 300,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 200,
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  initialDateTime: _selectedDate,
                                  onDateTimeChanged: (DateTime newDate) {
                                    setState(() {
                                      _selectedDate = newDate;
                                    });
                                  },
                                ),
                              ),
                              const Spacer(),
                              CustomButtonThree(title: "Save", onPress: (){
                                Navigator.pop(context);
                              }),
                            ],
                          ),
                        );
                      });
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.8,
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFD8E0),
                      border: Border.all(width: 2, color: const Color(0xFFE94057)),
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    "${_selectedDate.year}/${_selectedDate.day}/${_selectedDate.month}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  )),
                ),
              ),
            ),
            const Spacer(),
            CustomButtonOne(title: "NEXT", onPress: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HobbiesScreen(userGender: widget.userGender, userAge: userAge,)));
            }),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
