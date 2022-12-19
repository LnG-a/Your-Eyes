import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:your_eyes/resources/call_methods.dart';
import 'package:your_eyes/screens/callscreens/calll_screens_volunteer.dart';

import '../../../models/call.dart';

class PickupScreen extends StatelessWidget {
  final Call call;
  final CallMethods callMethods = CallMethods();

  PickupScreen({
    super.key,
    required this.call,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Center(
            child: Text(
              "Incoming...",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          _toolbar(context),
        ],
      ),
    );
  }

  static Future<bool> cameraAndMicrophonePermissionsGranted() async {
    await [Permission.microphone, Permission.camera].request();
    return await Permission.microphone.isGranted &&
        await Permission.camera.isGranted;
  }

  Widget _toolbar(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () async {
              await callMethods.endCall(call: call);
            },
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
          ),
          RawMaterialButton(
            onPressed: () async => await cameraAndMicrophonePermissionsGranted()
                ? Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CallScreenVolunteer(
                        call: call,
                      );
                      // return VoluntaryCallPage();
                    }),
                  )
                : {},
            child: Icon(
              Icons.call,
              color: Colors.white,
              size: 35.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.greenAccent,
            padding: const EdgeInsets.all(15.0),
          ),
        ],
      ),
    );
  }
}
