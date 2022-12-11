import 'package:flutter/material.dart';
import 'package:your_eyes/email_and_password/login_page.dart';

class ContentLoginPage extends StatelessWidget {
  const ContentLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Get Started",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 4,
                    color: const Color(0xff7F3DFF),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "By continuing, I confirm I am at\n"
                    " least 17 years old and i agree to\n"
                    " accept the Your Eyes Term &\n"
                    " Privacy Policy.",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 200),
            SizedBox(
              height: 70,
              width: 350,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoginPage(appUser: null)));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xff7F3DFF),
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
                ),
                child: const Text(
                  "Tiếp tục với Email",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 70,
              width: 350,
              child: TextButton(
                onPressed: () {
                  // final provider =
                  //     Provider.of<GoogleSignInProvider>(context, listen: false);
                  // provider.googleLogin();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xffFFFFFF),
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: Color(0xff7F3DFF), width: 4),
                  )),
                ),
                child: const Text(
                  "Tiếp tục với Google",
                  style: TextStyle(
                    color: Color(0xff7F3DFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 70,
              width: 350,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xff7F3DFF),
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
                ),
                child: const Text(
                  "Tiếp tục với Số điện thoại",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
