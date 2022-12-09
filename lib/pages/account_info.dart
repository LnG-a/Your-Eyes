import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thông tin cá nhân",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Text(
                  'Tên hiển thị: ${user.displayName!}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Địa chỉ email: ${user.email!}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
