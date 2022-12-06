import 'dart:math';

import 'package:flutter/material.dart';

import '../models/call.dart';
import '../models/user.dart';
import '../resources/call_methods.dart';
import '../screens/callscreens/call_screens.dart';

class CallUtils {
  static final CallMethods callMethods = CallMethods();

  static dial({required AppUser from, required AppUser to, context}) async {
    Call call = Call(from.uid, from.name, to.uid, to.name,
        Random().nextInt(1000).toString(), true);

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
