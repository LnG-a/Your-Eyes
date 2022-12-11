import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:your_eyes/blind_pages/main_page.dart';
import 'package:your_eyes/email_and_password/login_page.dart';
import 'package:your_eyes/resources/auth_method.dart';
import 'package:your_eyes/voluntary_pages/main_page.dart';

import '../design_system.dart';

// ignore: must_be_immutable
class VerifyScreen extends StatefulWidget {
  String email;
  final bool isBlind;

  VerifyScreen({Key? key, required this.email, required this.isBlind})
      : super(key: key);

  @override
  VerifyScreenState createState() => VerifyScreenState();
}

class VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.only(bottom: 230),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/illustrations4.png',
                fit: BoxFit.cover,
                width: 450,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text(
                  'Your email is on the way',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Check your email ${user.email} follow the instructions to verify your email',
                  style: TextStyle(
                    color: Colors.teal.shade700,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 20),
            height: 100,
            child: Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff7f3dff),
                    minimumSize: const Size(370, 65),
                    shape: shape,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginPage(
                              isBlind: widget.isBlind,
                            )));
                  },
                  child: const Text(
                    "Back to Login",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            )));
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    await AuthMethods.userLogin(widget.email, widget.isBlind);
    if (user.emailVerified) {
      timer.cancel();

      // ignore: use_build_context_synchronously
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => const MainPage()));
      if (widget.isBlind) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MainPage()));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MainPageVolunteer()));
      }
    }
  }
}
