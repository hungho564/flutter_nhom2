import 'package:flutter/material.dart';

class MyClassroom extends StatelessWidget {
  const MyClassroom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            block1(), // danh sách môn học
          ],
        ),
      ),
    );
  }

 
  Widget block1() {
    final List<Map<String, dynamic>> courses = [
      {
        "title": "XML và ứng dụng - Nhóm 1",
        "code": "2025-2026.1.TIN4583.001",
        "students": 58,
        "image":"https://images.unsplash.com/photo-1701456842118-25046a75483b?q=80&w=1121&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },
      {
        "title": "Lập trình ứng dụng cho các thiết bị di động",
        "code": "2025-2026.1.TIN4403.006",
        "students": 55,
        "image":"https://images.unsplash.com/photo-1701006905876-3c3cdc4ff15d?q=80&w=1032&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },
      {
        "title": "Lập trình ứng dụng cho các thiết bị di động",
        "code": "2025-2026.1.TIN4403.005",
        "students": 52,
        "image":"https://images.unsplash.com/photo-1676470017979-d2d0d04b4c83?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fHw%3D",
      },
      {
        "title": "Lập trình ứng dụng cho các thiết bị di động",
        "code": "2025-2026.1.TIN4403.004",
        "students": 50,
        "image":"https://images.unsplash.com/photo-1545048702-79362596cdc9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bm9lbHxlbnwwfHwwfHx8MA%3D%3D",
      },
      {
        "title": "Lập trình ứng dụng cho các thiết bị di động",
        "code": "2025-2026.1.TIN4403.003",
        "students": 52,
        "image":"https://images.unsplash.com/photo-1451772741724-d20990422508?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bm9lbHxlbnwwfHwwfHx8MA%3D%3D",
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(children: courses.map((c) => buildCourseCard(c)).toList()),
    );
  }


  Widget buildCourseCard(Map<String, dynamic> c) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: c["image"] != null
            ? DecorationImage(
                image: NetworkImage(c["image"]),
                fit: BoxFit.cover,
              )
            : null,
        color: c["image"] == null ? c["color"] : null,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.55),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    c["title"],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    c["code"],
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 27),
                  Text(
                    "${c["students"]} học viên",
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

