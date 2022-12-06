
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_eyes/main.dart';

class SettingInfo extends StatefulWidget {
  const SettingInfo({Key? key}) : super(key: key);

  @override
  State<SettingInfo> createState() => _SettingInfoState();

}
class _SettingInfoState extends State<SettingInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin cá nhân"),
      ),
      body: const Center(
        child: Text(
          'Các thông tin cần chỉnh sửa',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
