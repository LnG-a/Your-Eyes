import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:your_eyes/blind_pages/main_page.dart';
import 'package:your_eyes/resources/auth_method.dart';

import 'Auth/started_page.dart';
import 'design_system.dart';

const appId = "00c69fdbfc64436b9786ed1a9a24d67b";
const token =
    "007eJxTYNBeLFS8LnWDXA+/Wofab95jl+p/uWvtOODQva9/VopBSLECg4FBspllWkpSWrKZiYmxWZKluYVZaophomWikUmKmXnStLtzkxsCGRl4VO8xMEIhiM/OkJyRmJeXmsPAAABmzR/5";
const channelId = "channel";

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<User?> user;
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    AuthMethods.initCurrentAppUser();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Inter',
          primarySwatch: primaryViolet,
        ),
        home: FirebaseAuth.instance.currentUser == null
            ? const StartedPage()
            : MainPage());
  }
}
