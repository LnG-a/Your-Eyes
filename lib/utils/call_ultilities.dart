import 'package:flutter/material.dart';

import '../main.dart';
import '../models/call.dart';
import '../resources/call_methods.dart';
import '../screens/callscreens/call_screens.dart';

// Random().nextInt(1000).toString()
class CallUtils {
  static final CallMethods callMethods = CallMethods();

  static dial({required String fromId, required String toId, context}) async {
    Call call = Call(fromId, toId, channelId, true);

    bool callMade = await callMethods.makeCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CallScreen(call: call),
          ));
    }
  }
}
