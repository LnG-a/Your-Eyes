import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:permission_handler/permission_handler.dart';

import '../design_system.dart';
import '../utils/call_ultilities.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  final String title = "Sách nói";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trang chủ"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(
                      3000,
                      2000,
                    ),
                    shape: shape),
                onLongPress: () async {
                  await FlutterPhoneDirectCaller.callNumber("+84123456789");
                },
                onPressed: () async {
                  await [Permission.microphone, Permission.camera].request();
                  CallUtils.dial(
                    fromId: "lqtGaFILsOYzm1KkRq4lvp3akp52",
                    toId: "oogxsr3xWcZsFdB1xbgjMXua25i2",
                    context: context,
                  );

                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => BlindCallPage()));
                },
                child: const Text(
                  "Gọi",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
