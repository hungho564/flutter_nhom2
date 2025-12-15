import 'package:flutter/material.dart';
import 'package:flutter_nhom2/form_feedback.dart';
import 'package:flutter_nhom2/form_register.dart';
import 'package:flutter_nhom2/my_classroom.dart';
import 'package:flutter_nhom2/my_product.dart';
import 'package:flutter_nhom2/my_welcome.dart';
import 'package:flutter_nhom2/change_color_app.dart';
import 'package:flutter_nhom2/form_bmi.dart';
import 'package:flutter_nhom2/my_place.dart';
import 'package:flutter_nhom2/new_list.dart';
import 'package:flutter_nhom2/counter_app.dart';
import 'package:flutter_nhom2/form_login.dart';
import 'package:flutter_nhom2/profile_login.dart';


class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _MenuItem(1, Icons.home, 'My Place', const MyPlace()),
      _MenuItem(2, Icons.school, 'Classroom', const MyClassroom()),
      _MenuItem(3, Icons.person, 'My Welcome', const MyWelcome()),
      _MenuItem(4, Icons.palette, 'Ứng dụng đổi màu nền', const ChangeColorApp()),
      _MenuItem(5, Icons.exposure_plus_1, 'Đếm số', const CounterApp()), 
      _MenuItem(6, Icons.login, 'Form đăng nhập', const FormLogin()),
      _MenuItem(7, Icons.person_add, 'Form đăng ký', const FormRegister()),
      _MenuItem(8, Icons.health_and_safety, 'Tính chỉ số BMI', const FormBmi()),
      _MenuItem(9, Icons.feedback, 'Gửi phản hồi', const FormFeedback()),
      _MenuItem(10, Icons.shopping_cart, 'API Bán hàng', const MyProduct()),
      _MenuItem(11, Icons.api, 'API Tin tức', const NewsListScreen()),
      _MenuItem(12, Icons.login, 'Đăng nhập Profile', const ProfileLogin()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách bài tập Flutter'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),

      drawer: Drawer(
        backgroundColor: const Color(0xFFF9F6EE),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Nhóm 2 - Flutter\nChọn bài tập để xem',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            ...items.map((it) => Column(
                  children: [
                    ListTile(
                      leading: Icon(it.icon, color: Colors.blueGrey.shade700),
                      title: Text(
                        '${it.index}. ${it.title}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      hoverColor: Colors.blue.withOpacity(0.07),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => it.page),
                        );
                      },
                    ),
                    const Divider(height: 1, thickness: 0.5),
                  ],
                )),
          ],
        ),
      ),

      body: const Center(
        child: Text(
          '👈 Vuốt từ trái sang hoặc bấm menu để chọn bài',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _MenuItem {
  final int index;
  final IconData icon;
  final String title;
  final Widget page;
  const _MenuItem(this.index, this.icon, this.title, this.page);
}
