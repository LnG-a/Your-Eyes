import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:your_eyes/Auth/components/content_login_page.dart';
import 'package:your_eyes/pages/main_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder (
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return const MainPage();
            } else if (snapshot.hasError){
              return const Center(child: Text("Something Went Wrong"));
            } else {
              return const ContentLoginPage();
            }
          },
        ),
    );
  }
}
