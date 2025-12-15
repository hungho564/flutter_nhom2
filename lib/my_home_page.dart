import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Text(
              "Xin chao moi nguoi",
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          ),
          Icon(Icons.heart_broken, size: 120, color: Colors.red),
          Text(
            "Lập trình DĐ - Nhóm 2",
            style: TextStyle(color: Colors.blueAccent, fontSize: 30),
          ),
        ],
      ),
    );
  }
}
