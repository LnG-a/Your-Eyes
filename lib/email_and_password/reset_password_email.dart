import 'package:flutter/material.dart';

import '../design_system.dart';
import 'login_page.dart';

// ignore: must_be_immutable
class ResetPasswordEmail extends StatelessWidget {
  final String email;

  const ResetPasswordEmail({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
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
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Check your email $email follow the instructions to verify your password',
                  style: TextStyle(
                    color: Colors.teal.shade700,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
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
                              appUser: null,
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
}
