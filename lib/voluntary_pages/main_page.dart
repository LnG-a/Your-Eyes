import 'package:flutter/material.dart';
import 'package:your_eyes/blind_pages/audio_book_page.dart';
import 'package:your_eyes/blind_pages/settings_page.dart';

import 'home_page.dart';

class MainPageVolunteer extends StatefulWidget {
  const MainPageVolunteer({super.key});

  @override
  _MainPageVolunteerState createState() => _MainPageVolunteerState();
}

class _MainPageVolunteerState extends State<MainPageVolunteer> {
  int currentIndex = 1;

  PageController pageController = PageController(initialPage: 1);

  final volunteerScreens = [
    AudioBookPage(),
    HomePageVolunteer(),
    SettingsPage(),
  ];

  final bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.book, size: 30),
      label: "Sách nói",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        size: 30,
      ),
      label: 'Trang chủ',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings, size: 30),
      label: "Cài đặt",
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
        children: volunteerScreens,
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
