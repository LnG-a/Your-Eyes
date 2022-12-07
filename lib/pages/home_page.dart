import 'package:flutter/material.dart';
import 'package:your_eyes/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child:
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize:  const Size(
                      3000,
                      2000,
                    ),
                    shape: shape
                ),
                onLongPress: () {
                  print("long press");
                },
                onPressed: () {
                  print("press");

                },
                child: const Text("Gọi",style: TextStyle(fontSize: 50),),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
