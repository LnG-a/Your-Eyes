import 'package:flutter/material.dart';
import 'package:your_eyes/main.dart';
import 'package:your_eyes/screens/callscreens/call_screens.dart';

import '../models/call.dart';

class HomePageVolunteer extends StatefulWidget {
  const HomePageVolunteer({Key? key}) : super(key: key);

  @override
  State<HomePageVolunteer> createState() => _HomePageVolunteerState();
}

class _HomePageVolunteerState extends State<HomePageVolunteer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xff7F3DFF),
                  ),
                  child: ListView(
                    children: [
                      Image.asset(
                        'assets/images/earth.png',
                        height: 200,
                        width: 200,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: "1.000.642\n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontFamily: "Inter",
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: "Khiếm thị",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: "6.116.368\n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontFamily: "Inter",
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                    text: "Tình nguyện viên",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 130,
              width: 604,
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  elevation: MaterialStateProperty.all(8),
                  shadowColor: MaterialStateProperty.all(Colors.grey),
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "Duong\n",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                      fontFamily: "Inter",
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                          text: "Là thành viên từ 6 th10, 2022",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 94,
              width: 604,
              padding: const EdgeInsets.fromLTRB(15, 19, 15, 0),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CallScreen(
                                call: Call(
                              "lqtGaFILsOYzm1KkRq4lvp3akp52",
                              "oogxsr3xWcZsFdB1xbgjMXua25i2",
                              channelId,
                              false,
                            ))));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff7F3DFF)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(8),
                    shadowColor: MaterialStateProperty.all(Colors.grey),
                  ),
                  child: const Text(
                    'Học cách trả lời cuộc gọi',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )),
            ),
            Container(
              height: 94,
              width: 604,
              padding: const EdgeInsets.fromLTRB(15, 19, 15, 0),
              child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff7F3DFF)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(8),
                    shadowColor: MaterialStateProperty.all(Colors.grey),
                  ),
                  child: const Text(
                    'Quan sát người thân',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
