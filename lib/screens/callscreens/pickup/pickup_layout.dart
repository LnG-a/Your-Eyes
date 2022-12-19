import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:your_eyes/resources/auth_method.dart';

import '../../../main.dart';
import '../../../models/call.dart';
import '../../../resources/call_methods.dart';
import 'pickup_screen.dart';

class PickupLayout extends StatelessWidget {
  final Widget child;
  final CallMethods callMethods = CallMethods();

  PickupLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: callMethods.callStream(uid: AuthMethods.currentAppUser.uid),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.exists) {
          Call call = Call(
            "lqtGaFILsOYzm1KkRq4lvp3akp52",
            "oogxsr3xWcZsFdB1xbgjMXua25i2",
            channelId,
            true,
          );
          if (!AuthMethods.currentAppUser.isBlind) call.hasDialled = false;
          if (!call.hasDialled) {
            return PickupScreen(call: call);
          }
        }
        return child;
      },
    );
  }
}
