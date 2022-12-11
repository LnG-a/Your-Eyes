import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:your_eyes/email_and_password/reset_password.dart';
import 'package:your_eyes/email_and_password/sign_up.dart';
import 'package:your_eyes/models/user.dart';
import 'package:your_eyes/resources/auth_method.dart';

import '../blind_pages/main_page.dart';
import '../design_system.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  AppUser? appUser;

  LoginPage({Key? key, required this.appUser}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String error = '';
  bool hidePassword = true;

  void _singIn() async {
    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text))
          .user;
      if (user != null) {
        widget.appUser = await AuthMethods.userLogin(_emailController.text);
        setState(() {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MainPage()));
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.message!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: const Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 100, left: 20, right: 30),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey.shade900),
                        ),
                      ),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey.shade900),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: Icon(hidePassword
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.remove_red_eye))),
                      obscureText: hidePassword,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          error,
                          style: const TextStyle(color: Colors.red),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    buildButton(
                      "Login",
                      large,
                      colorType1,
                      () async {
                        _singIn();
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ResetPassword()));
                      },
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Don\'t have an acoount yet? ',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignupPage()));
                          },
                          child: const Text('Sign Up',
                              style: TextStyle(
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
