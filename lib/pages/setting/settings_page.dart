import 'package:flutter/material.dart';
import 'package:your_eyes/main.dart';
import 'package:your_eyes/pages/location/location.dart';
import 'package:your_eyes/pages/setting/setting_info.dart';

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
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const TitleSession(
            title: 'Hồ sơ cá nhân',
          ),
          ButtonElement(text: "Thông tin cá nhân", onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingInfo()));
          }),
          ButtonElement(text: "Đổi mật khẩu", onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
          }),
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
          ElevatedButton(onPressed: () {}, child: Text("Đăng xuất", style: const TextStyle(color: Colors.white, fontSize: 18),))
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
          padding: EdgeInsets.all(0),
        ),
        onPressed: onPressed,
        child: Text(text,
            style: const TextStyle(color: Colors.black, fontSize: 18)));
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
          color: mainColor, fontSize: 20),
    );
  }
}
