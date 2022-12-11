import 'package:flutter/material.dart';

class CommunityPageVolunteer extends StatefulWidget {
  const CommunityPageVolunteer({Key? key}) : super(key: key);

  @override
  State<CommunityPageVolunteer> createState() => _CommunityPageVolunteerState();
}

class _CommunityPageVolunteerState extends State<CommunityPageVolunteer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Community"),
        automaticallyImplyLeading: false,
      ),
    );
  }
}
