import 'package:flutter/material.dart';
import 'package:your_eyes/resources/auth_method.dart';

import '../Auth/started_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
          ButtonElement(text: "Thông tin cá nhân", onPressed: () {}),
          ButtonElement(text: "Đổi mật khẩu", onPressed: () {}),
          ButtonElement(text: "Thay đổi email", onPressed: () {}),
          ButtonElement(text: "Thông báo", onPressed: () {}),
          ButtonElement(text: "Thông báo qua email", onPressed: () {}),
          const TitleSession(
            title: 'Hỗ trợ và phản hồi',
          ),
          ButtonElement(text: "Câu hỏi thường gặp", onPressed: () {}),
          ButtonElement(text: "Gửi phản hồi cho chúng tôi", onPressed: () {}),
          ButtonElement(
              text: "Điều khoàn và chính sách bảo mật", onPressed: () {}),
          const TitleSession(
            title: "Kết nối với chúng tôi",
          ),
          ButtonElement(text: "Facebook", onPressed: () {}),
          ButtonElement(text: "Twitter", onPressed: () {}),
          ButtonElement(text: "Youtube", onPressed: () {}),
          ButtonElement(text: "Instagram", onPressed: () {}),
          //buildButton("Đăng xuất", large, colorType1, () {}),
          ElevatedButton(
            onPressed: () {
              // final provider =
              //     Provider.of<GoogleSignInProvider>(context, listen: false);
              // provider.logOut();
              Navigator.of(context).popUntil((route) => route.isFirst);

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => StartedPage()));
              AuthMethods.userLogout();
            },
            child: const Text("Đăng xuất"),
          ),
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
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: Text(text,
            style: const TextStyle(color: Colors.black, fontSize: 14)));
  }
}

class TitleSession extends StatelessWidget {
  final String title;

  const TitleSession({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
    );
  }
}
