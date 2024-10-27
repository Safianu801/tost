import 'package:flutter/material.dart';

import '../features/home/screens/home_screen.dart';
import '../features/home/screens/location_screen.dart';
import '../features/home/screens/matches_screen.dart';
import '../features/home/screens/message_screen.dart';
import '../features/home/screens/profile_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  List bottomNavigationItem = const [
    HomeScreen(),
    LocationScreen(),
    MatchesScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;

  void onItemSelected(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavigationItem[currentIndex],
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
        height: 63,
        width: MediaQuery.of(context).size.width,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(50)),
        child: BottomNavigationBar(
            onTap: onItemSelected,
            currentIndex: currentIndex,
            backgroundColor: Color(0xFFFFD8E0),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color(0xFFDC143C),
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: currentIndex == 0
                            ? const Color(0xFFDC143C)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Image.asset(
                        "assets/images/home-filled.png",
                        color: currentIndex == 0
                            ? Colors.white
                            : Color(0xFFDC143C),
                      )),
                    ),
                  ),
                  label: "",
                  backgroundColor: Color(0xFFFFD8E0)),
              BottomNavigationBarItem(
                  icon: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: currentIndex == 1
                            ? const Color(0xFFDC143C)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Image.asset(
                        "assets/images/map_marker_outlined.png",
                        color: currentIndex == 1
                            ? Colors.white
                            : Color(0xFFDC143C),
                      )),
                    ),
                  ),
                  label: "",
                  backgroundColor: Color(0xFFFFD8E0)),
              BottomNavigationBarItem(
                  icon: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: currentIndex == 2
                            ? const Color(0xFFDC143C)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Image.asset(
                        "assets/images/heart_filled.png",
                        color: currentIndex == 2
                            ? Colors.white
                            : Color(0xFFDC143C),
                      )),
                    ),
                  ),
                  label: "",
                  backgroundColor: Color(0xFFFFD8E0)),
              BottomNavigationBarItem(
                  icon: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: currentIndex == 3
                            ? const Color(0xFFDC143C)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Image.asset(
                        "assets/images/mail.png",
                        color: currentIndex == 3
                            ? Colors.white
                            : Color(0xFFDC143C),
                      )),
                    ),
                  ),
                  label: "",
                  backgroundColor: Color(0xFFFFD8E0)),
              BottomNavigationBarItem(
                  icon: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: currentIndex == 4
                            ? const Color(0xFFDC143C)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Image.asset(
                        "assets/images/profile-filled.png",
                        color: currentIndex == 4
                            ? Colors.white
                            : Color(0xFFDC143C),
                      )),
                    ),
                  ),
                  label: "",
                  backgroundColor: Color(0xFFFFD8E0)),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
