import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_remote_view.dart' as rtc_remote_view;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:your_eyes/models/call.dart';
import 'package:your_eyes/resources/call_methods.dart';

import '../../main.dart';
import '../../resources/auth_method.dart';

class CallScreenVolunteer extends StatefulWidget {
  final Call call;

  CallScreenVolunteer({
    super.key,
    required this.call,
  });

  @override
  State<CallScreenVolunteer> createState() => _CallScreenVolunteerState();
}

class _CallScreenVolunteerState extends State<CallScreenVolunteer> {
  int _remoteUid = -1;
  late RtcEngine _engine;
  late StreamSubscription callStreamSubscription;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      callStreamSubscription = CallMethods()
          .callStream(uid: AuthMethods.currentAppUser.uid)
          .listen((DocumentSnapshot ds) {
        // defining the logic
        if (!ds.exists) {
          Navigator.pop(context);
        }
      });
    });
    initAgora();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.create(appId);
    await _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid joined");
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
          setState(() {
            _remoteUid = -1;
          });
        },
      ),
    );

    await _engine.joinChannel(token, channelId, null, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _remoteVideo(),
          ),
          callEndButton()
        ],
      ),
    );
  }

  Widget _remoteVideo() {
    if (_remoteUid != -1) {
      return rtc_remote_view.SurfaceView(
        uid: _remoteUid,
        channelId: channelId,
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  Widget callEndButton() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 40),
      child: RawMaterialButton(
        onPressed: () => CallMethods().endCall(
          call: widget.call,
        ),
        child: Icon(
          Icons.call_end,
          color: Colors.white,
          size: 35,
        ),
        shape: CircleBorder(),
        elevation: 2,
        fillColor: Colors.redAccent,
        padding: EdgeInsets.all(15),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    CallMethods().endCall(
      call: widget.call,
    );
    _engine.leaveChannel();
    _engine.destroy();
  }
}
