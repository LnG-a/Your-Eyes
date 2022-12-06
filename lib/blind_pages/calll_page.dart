import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as rtc_local_view;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../main.dart';

class BlindCallPage extends StatefulWidget {
  const BlindCallPage({Key? key}) : super(key: key);

  @override
  State<BlindCallPage> createState() => _BlindCallPageState();
}

class _BlindCallPageState extends State<BlindCallPage> {
  int _remoteUid = -1;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  @override
  void dispose() async {
    super.dispose();
    await _engine.leaveChannel();
    await _engine.destroy();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.create(appId);
    await _engine.enableVideo();
    await _engine.switchCamera();
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
          title: const Text('Blind Screen'),
        ),
        body: Center(
          child: Stack(
            children: [localView(), callEndButton()],
          ),
        ));
  }

  Widget callEndButton() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 40),
      child: RawMaterialButton(
        onPressed: () => Navigator.pop(context),
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

  Widget localView() {
    return rtc_local_view.SurfaceView();
  }
}
