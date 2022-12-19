import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as rtc_local_view;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:your_eyes/main.dart';
import 'package:your_eyes/resources/auth_method.dart';

import '../../models/call.dart';
import '../../resources/call_methods.dart';

class CallScreen extends StatefulWidget {
  final Call call;

  CallScreen({
    required this.call,
  });

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final CallMethods callMethods = CallMethods();
  late StreamSubscription callStreamSubscription;
  int _remoteUid = -1;
  final _infoStrings = <String>[];

  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    addPostFrameCallback();
    initializeAgora();
  }

  addPostFrameCallback() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      callStreamSubscription = callMethods
          .callStream(uid: AuthMethods.currentAppUser.uid)
          .listen((DocumentSnapshot ds) {
        // defining the logic
        if (!ds.exists) {
          Navigator.pop(context);
        }
      });
    });
  }

  Future<void> initializeAgora() async {
    if (appId.isEmpty) {
      setState(() {
        _infoStrings.add(
          'APP_ID missing, please provide your APP_ID in settings.dart',
        );
        _infoStrings.add('Agora Engine is not starting');
      });
      return;
    }
    _engine = await RtcEngine.create(appId);
    await _engine.enableVideo();
    _engine.setEventHandler(RtcEngineEventHandler(joinChannelSuccess: (
      String channel,
      int uid,
      int elapsed,
    ) {
      setState(() {
        final info = 'onJoinChannel: $channel, uid: $uid';
        _infoStrings.add(info);
      });
    }, userJoined: (int uid, int elapsed) {
      setState(() {
        final info = 'onUserJoined: $uid';
        _infoStrings.add(info);
        _remoteUid = uid;
      });
    }, userOffline: (int a, UserOfflineReason reason) {
      callMethods.endCall(call: widget.call);
      setState(() {
        final info =
            'onUserOffline: a: ${a.toString()}, b: ${reason.toString()}';
        _infoStrings.add(info);
      });
    }));
    _engine.switchCamera();
    await _engine.joinChannel(token, channelId, null, 0);
  }

  /// Toolbar layout
  Widget _toolbar() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              callMethods.endCall(
                call: widget.call,
              );
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
        ],
      ),
    );
  }

  @override
  void dispose() {
    callMethods.endCall(
      call: widget.call,
    );
    // clear users
    // destroy sdk
    // _engine.leaveChannel();
    // _engine.destroy();
    _engine.switchCamera();
    callStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: <Widget>[
            _view(),
            _toolbar(),
          ],
        ),
      ),
    );
  }

  Widget _view() {
    return rtc_local_view.SurfaceView();
  }
}
