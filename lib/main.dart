import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Auth/components/google_sign_in.dart';
import 'Auth/started_page.dart';

final shape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20),
);
const mainColor = Color(0xff7f3dff);
const appId = "00c69fdbfc64436b9786ed1a9a24d67b";
const token =
    "007eJxTYHByDb975+y6+Nv5KVPsn85UVl/gKNMle8DoU17V05TM3tcKDAYGyWaWaSlJaclmJibGZkmW5hZmqSmGiZaJRiYpZuZJe+/2JTcEMjI0pygxMjJAIIjPy5CWWVRcEp+ckZiXl5rDwAAA1+IkOw==";
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
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Inter',
          primarySwatch: Colors.blue,
        ),
        home: const StartedPage(),
      ),
    );
  }
}
