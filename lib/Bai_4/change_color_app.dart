import 'dart:math';
import 'package:flutter/material.dart';

class ChangeColorApp extends StatefulWidget {
  const ChangeColorApp({super.key});

  @override
  State<ChangeColorApp> createState() => _ChangeColorAppState();
}

class _ChangeColorAppState extends State<ChangeColorApp> {
  Color currentColor = Colors.purple;

  final List<Color> colors = [
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.red,
  ];

  final Map<Color, String> colorNames = {
    Colors.purple: 'Tím',
    Colors.orange: 'Cam',
    Colors.blue: 'Xanh dương',
    Colors.red: 'Đỏ',
  };

  void changeColor() {
    setState(() {
      currentColor = colors[Random().nextInt(colors.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: myBody(),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      title: const Text("Ứng dụng đổi màu"),
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 6,
    );
  }

  Widget myBody() {
    return Container(
      color: currentColor,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Màu sắc hiện tại",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Text(
            colorNames[currentColor] ?? '',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: changeColor,
                icon: const Icon(Icons.color_lens),
                label: const Text("Đổi màu"),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() => currentColor = Colors.purple);
                },
                icon: const Icon(Icons.refresh),
                label: const Text("Reset"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
