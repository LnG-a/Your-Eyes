import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
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
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initVoice();
  }

  int currentIndex = 1;
  PageController pageController = PageController(initialPage: 1);

  final blindScreens = [
    const AudioBookPage(),
    const HomePage(),
    const SettingsPage(),
  ];

  final volunteerScreens = [
    const AudioBookPage(),
    const HomePageVolunteer(),
    const SettingsPage(),
  ];
  final title = [
    "Bạn đang ở trang sách nói",
    "Bạn đang ở trang chủ",
    "Bạn đang ở trang cài đặt"
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

  Future<void> initVoice() async {
    await flutterTts.setPitch(1);
    await flutterTts.setLanguage("vi");
    await flutterTts.speak("Bạn đang ở trang chủ");
  }

  speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (newIndex) {
            setState(() => {
                  currentIndex = newIndex,
                });
            speak(title[currentIndex]);
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
