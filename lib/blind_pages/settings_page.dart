import 'package:flutter/material.dart';
import 'package:your_eyes/resources/auth_method.dart';

import '../Auth/started_page.dart';
import '../design_system.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  final String title = "Sách nói";

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cài đặt"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const TitleSession(
            title: 'Hồ sơ cá nhân',
          ),
          ButtonElement(
              text: "Đổi mật khẩu",
              onPressed: () {
                print(AuthMethods.currentAppUser.email);
              }),
          ButtonElement(
              text: "Thay đổi email",
              onPressed: () {
                print(AuthMethods.currentAppUser.isBlind);
              }),
          ButtonElement(text: "Thông báo", onPressed: () {}),
          ButtonElement(text: "Thông báo qua email", onPressed: () {}),
          const SizedBox(
            height: 10,
          ),
          const TitleSession(
            title: 'Hỗ trợ và phản hồi',
          ),
          ButtonElement(text: "Câu hỏi thường gặp", onPressed: () {}),
          ButtonElement(text: "Gửi phản hồi cho chúng tôi", onPressed: () {}),
          ButtonElement(
              text: "Điều khoàn và chính sách bảo mật", onPressed: () {}),
          const SizedBox(
            height: 10,
          ),
          const TitleSession(
            title: "Kết nối với chúng tôi",
          ),

          ButtonElement(text: "Facebook", onPressed: () {}),
          ButtonElement(text: "Twitter", onPressed: () {}),
          ButtonElement(text: "Youtube", onPressed: () {}),
          ButtonElement(text: "Instagram", onPressed: () {}),
          const SizedBox(
            height: 20,
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: mainColor,
              minimumSize: const Size(380, 55),
              shape: shape,
            ),
            // onPressed: () {
            //   Navigator.of(context).popUntil((route) => route.isFirst);
            //
            //   Navigator.of(context).pushReplacement(
            //       MaterialPageRoute(builder: (context) => const StartedPage()));
            //   AuthMethods.userLogout();
            // },
            child: const Text(
              "Đăng xuất",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                        padding: const EdgeInsets.only(
                          top: 30,
                          bottom: 30,
                        ),
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Đăng xuất",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Bạn có chắc muốn đăng xuất?",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade500),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildButton("No", half, colorType2, () {
                                  Navigator.pop(context);
                                }),
                                buildButton("Yes", half, colorType1, () {
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);

                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const StartedPage()));
                                  AuthMethods.userLogout();
                                })
                              ],
                            )
                          ],
                        ));
                  });
            },
          )
          // ElevatedButton(
          //   onPressed: () {
          //     // final provider =
          //     //     Provider.of<GoogleSignInProvider>(context, listen: false);
          //     // provider.logOut();
          //
          //   },
          //   child: const Text("Đăng xuất"),
          // ),
        ],
      ),
    );
  }
}

class ButtonElement extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonElement({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: onPressed,
        child: Text(text,
            style: const TextStyle(color: Colors.black, fontSize: 16)));
  }
}

class TitleSession extends StatelessWidget {
  final String title;

  const TitleSession({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: mainColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}
