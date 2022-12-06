import 'package:flutter/material.dart';
import 'package:your_eyes/pages/community_page.dart';
import 'package:your_eyes/pages/home_page.dart';
import 'package:your_eyes/pages/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 1;

  PageController pageController = PageController(initialPage: 1);

  final bottomNavigationBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite,size: 30),
        label: "Community",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.home,size: 30,),
      label: 'Home',
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
          CommunityPage(),
          HomePage(),
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