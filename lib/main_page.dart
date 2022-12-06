import 'package:flutter/material.dart';
import 'package:your_eyes/HomePage/home_volunteer.dart';
import 'package:your_eyes/community_page.dart';
import 'package:your_eyes/home_page.dart';
import 'package:your_eyes/settings_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  PageController pageController = PageController(initialPage: 0);

  final bottomNavigationBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home,size: 30,),
        label: 'Home',
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite,size: 30),
        label: "Commmunity",
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings,size: 30),
        label: "Settings",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (newIndex) =>{
          setState(()=>{
            currentIndex=newIndex
          })
        },
        children: const [
          HomePageVolunteer(),
          CommunityPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: currentIndex,
        items: bottomNavigationBarItems,
        onTap: (index) {
          setState(() {
            pageController.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
          });
        },
        //type: BottomNavigationBarType.fixed,
      ),
    );
  }
}