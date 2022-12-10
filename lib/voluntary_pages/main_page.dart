import 'package:flutter/material.dart';
import 'package:your_eyes/voluntary_pages/community.dart';
import 'package:your_eyes/voluntary_pages/settings_page.dart';

import 'home_page.dart';

class MainPageVolunteer extends StatefulWidget {
  const MainPageVolunteer({super.key});

  @override
  _MainPageVolunteerState createState() => _MainPageVolunteerState();
}

class _MainPageVolunteerState extends State<MainPageVolunteer> {
  int currentIndex = 1;

  PageController pageController = PageController(initialPage: 1);

  final bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite, size: 30),
      label: "Community",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        size: 30,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings, size: 30),
      label: "Settings",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (newIndex) => {
          setState(() => {currentIndex = newIndex})
        },
        children: const [
          CommunityPageVolunteer(),
          HomePageVolunteer(),
          SettingsPageVolunteer(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: currentIndex,
        items: bottomNavigationBarItems,
        onTap: (index) {
          setState(() {
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut);
          });
        },
        //type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
