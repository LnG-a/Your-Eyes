import 'package:flutter/material.dart';
import 'package:your_eyes/resources/auth_method.dart';
import 'package:your_eyes/screens/callscreens/pickup/pickup_layout.dart';

import '../voluntary_pages/home_page.dart';
import 'audiobook/audio_book_page.dart';
import 'home_page.dart';
import 'settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    //   userProvider = Provider.of<UserProvider>(context, listen: false);
    //   userProvider.refreshUser();
    // });
  }

  int currentIndex = 1;

  PageController pageController = PageController(initialPage: 1);

  final blindScreens = [
    AudioBookPage(),
    HomePage(),
    SettingsPage(),
  ];

  final volunteerScreens = [
    AudioBookPage(),
    HomePageVolunteer(),
    SettingsPage(),
  ];

  final bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite, size: 30),
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
    return PickupLayout(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (newIndex) => {
            setState(() => {currentIndex = newIndex})
          },
          children: AuthMethods.currentAppUser.isBlind
              ? blindScreens
              : volunteerScreens,
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
      ),
    );
  }
}
