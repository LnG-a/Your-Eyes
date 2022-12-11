import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:your_eyes/email_and_password/reset_password_email.dart';

import '../design_system.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  ResetPasswordState createState() => ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {
  final auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  String error = '';

  int success = 0;

  void _reset() async {
    try {
      await auth.sendPasswordResetEmail(email: _emailController.text);
      setState(() {
        success = 1;
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ResetPasswordEmail(email: _emailController.text)));
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        success = 2;
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
          "Forget Password",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: const Text(
              "Don’t worry. \nEnter your email and we’ll send you a link to reset your password.",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 50, left: 20, right: 30),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.grey, width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey.shade900),
                  ),
                ),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    success == 0 ? '' : error,
                    style: const TextStyle(color: Colors.red),
                  )),
              const SizedBox(
                height: 10,
              ),
              buildButton("Continue", large, colorType1, () async {
                _reset();
              }),

              //const SizedBox(height: 15,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     InkWell(
              //       onTap: () {
              //         Navigator.of(context).pop();
              //       },
              //       child: const Text(
              //           'Go Back',
              //           style: TextStyle(
              //               color: Colors.grey,
              //               fontFamily: 'Montserrat',
              //               fontWeight: FontWeight.bold,
              //               decoration: TextDecoration.underline,
              //               fontSize: 15
              //           )
              //       ),
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ]),
    );
  }
}
