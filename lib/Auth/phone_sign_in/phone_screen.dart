import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_eyes/Auth/components/firebase_auth_methods.dart';

class PhoneScreen extends StatefulWidget {
  static String routeName = 'phone';
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nhập số điện thoại",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.transparent, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.transparent, width: 0),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              filled: true,
              fillColor: const Color(0xffe2e2e2),
              hintText: "Nhập số điện thoại",
              hintStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          TextButton(
            onPressed: (){
              //context.read<FirebaseAuthMethod>().phoneSignIn(context, phoneController.text);
              final provider = Provider.of<FirebaseAuthMethod>(
                  context, listen: false);
              provider.phoneSignIn(context, phoneController.text);
            },
            style: TextButton.styleFrom(
              minimumSize: const Size(double.infinity, 40),
              backgroundColor: Colors.blue
            ),
            child: const Text(
              "Gửi mã OTP",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
