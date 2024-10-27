import 'package:flutter/material.dart';
import '../../../../utilities/custom_back_navigator.dart';
import '../../../../utilities/cutom_button_three.dart';
import 'date_of_birth_screen.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String gender = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackNavigator(onPress: (){
          Navigator.pop(context);
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const Text(
              "Select Gender",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 50,),
            Center(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    gender = "Male";
                  });
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width/1.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color:gender == "Male" ? const Color(0xFFE94057) : Colors.grey),
                    color: gender == "Male" ? const Color(0xFFE94057) : Colors.transparent
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Male",
                          style: TextStyle(
                            color: gender == "Male" ? Colors.white : Colors.black
                          ),
                        ),
                        Icon(Icons.check, size: 15, color: gender == "Male" ? Colors.white : Colors.transparent,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Center(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    gender = "Female";
                  });
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width/1.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color:gender == "Female" ? const Color(0xFFE94057) : Colors.grey),
                      color: gender == "Female" ? const Color(0xFFE94057) : Colors.transparent
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Female",
                          style: TextStyle(
                              color: gender == "Female" ? Colors.white : Colors.black
                          ),
                        ),
                        Icon(Icons.check, size: 15, color: gender == "Female" ? Colors.white : Colors.transparent,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Center(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    gender = "Prefer Not To Say";
                  });
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width/1.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color:gender == "Prefer Not To Say" ? const Color(0xFFE94057) : Colors.grey),
                      color: gender == "Prefer Not To Say" ? const Color(0xFFE94057) : Colors.transparent
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Prefer Not To Say",
                          style: TextStyle(
                              color: gender == "Prefer Not To Say" ? Colors.white : Colors.black
                          ),
                        ),
                        Icon(Icons.check, size: 15, color: gender == "Prefer Not To Say" ? Colors.white : Colors.transparent,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            CustomButtonThree(title: "Continue", onPress: (){
              if (gender == "") {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please select one of the options provided")));
              } else {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DateOfBirthScreen(userGender: gender,)));
              }
            }),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
