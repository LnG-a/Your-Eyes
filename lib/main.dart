import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Auth/started_page.dart';
import 'design_system.dart';

const appId = "00c69fdbfc64436b9786ed1a9a24d67b";
const token =
    "007eJxTYPi8+aLHZU73Fd9PqXKErJTqjE5ckSZlLp+o+Vgj64KKRZICg4FBspllWkpSWrKZiYmxWZKluYVZaophomWikUmKmXmS76wpyQ2BjAxHNpmyMjJAIIjPy5CWWVRcEp+ckZiXl5rDwAAADkYhvw==";
const channelId = "first_channel";

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Inter',
        primarySwatch: primaryViolet,
      ),
      home: const StartedPage(),
    );
  }
}
