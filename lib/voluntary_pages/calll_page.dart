import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_remote_view.dart' as rtc_remote_view;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../main.dart';

class VoluntaryCallPage extends StatefulWidget {
  const VoluntaryCallPage({Key? key}) : super(key: key);

  @override
  State<VoluntaryCallPage> createState() => _VoluntaryCallPageState();
}

class _VoluntaryCallPageState extends State<VoluntaryCallPage> {
  int _remoteUid = -1;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  @override
  void dispose() {
    super.dispose();
    _engine.leaveChannel();
    _engine.destroy();
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
      appBar: AppBar(
        title: const Text("Voluntary Screen"),
      ),
      body: Stack(
        children: [
          Center(
            child: _remoteVideo(),
          ),
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
      return Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}
