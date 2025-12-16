import 'package:flutter/material.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(   
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            block1(),
            block2(),
            block3(),
            block4(),
          ],
        ),
      ),
    );
  }

Widget block1() {
  const src =
      "https://images.unsplash.com/photo-1755899850036-084006cbc1c2?q=80&w=844&auto=format&fit=crop&ixlib=rb-4.1.0";

  return SizedBox(
    height: 350, 
    child: Image.network(src, fit: BoxFit.cover),
  );
}
  Widget block2() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Oeschinen Lake Campground",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  "Kandersteg, Switzerland",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),

          Row(
            children: const [
              Icon(Icons.star, color: Colors.red),
              SizedBox(width: 4),
              Text("41"),
            ],
          ),
        ],
      ),
    );
  }

  Widget block3() {
    Widget buildButton(IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButton(Icons.call, "CALL"),
          buildButton(Icons.near_me, "ROUTE"),
          buildButton(Icons.share, "SHARE"),
        ],
      ),
    );
  }

  Widget block4() {
    var data =
        "Được dịch từ tiếng Anh - Tết Trung Thu, còn được gọi là Tết Trăng hoặc Tết Bánh Trung Thu, "
        "là một lễ hội thu hoạch được tổ chức trong văn hóa Trung Quốc. "
        "Lễ hội diễn ra vào ngày 15 tháng 8 âm lịch, khi trăng tròn, "
        "tương ứng khoảng từ giữa tháng 9 đến đầu tháng 10 dương lịch.";
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        data,
        style: TextStyle(fontSize: 14, height: 1.4),
      ),
    );
  }
}
