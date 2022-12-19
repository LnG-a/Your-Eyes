import 'package:flutter/material.dart';

class HowToAnswerPage extends StatelessWidget {
  const HowToAnswerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Học cách trả lời cuộc gọi"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(height: 20),
          Image.asset(
            'assets/images/answer_call.jpg',
            height: 200,
            width: 200,
          ),
          SizedBox(height: 10),
          Text(
            "Khi một người mù hoặc khiếm thị yêu cầu trợ giúp, ứng dụng sẽ thông báo cho nhiều tình nguyện viên và người đầu tiên phản hồi sẽ được kết nối. Khi bạn nhân được một cuộc gọi, tất cả những gì bạn cần làm là chấp nhận đó",
            style: TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.justify,
          ),
        ]),
      ),
    );
  }
}
