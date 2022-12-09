import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:your_eyes/Auth/components/content_login_page.dart';
import 'package:your_eyes/voluntary_pages/main_page.dart';

import '../blind_pages/main_page.dart';

class Login extends StatefulWidget {
  final bool isBlind;
  const Login({Key? key, required this.isBlind}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return widget.isBlind
                ? const MainPage()
                : const MainPageVolunteer();
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something Went Wrong"));
          } else {
            return const ContentLoginPage();
          }
        },
      ),
    );
  }
}
