import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/main_page.dart';

final shape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20),
);

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Inter',
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}