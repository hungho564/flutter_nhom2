import 'package:flutter/material.dart';
import 'package:flutter_nhom2/home_menu.dart';
// import 'package:flutter_nhom2/new_list.dart';
// import 'package:flutter_nhom2/form_bmi.dart';
// import 'package:flutter_nhom2/form_feedback.dart';
// import 'package:flutter_nhom2/form_register.dart';
// import 'package:flutter_nhom2/form_login.dart';
// import 'package:flutter_nhom2/change_color_app.dart';
// import 'package:flutter_nhom2/counter_app.dart';
// import 'package:flutter_nhom2/my_home_page.dart';
// import 'package:flutter_nhom2/my_place.dart';
// import 'package:flutter_nhom2/my_product.dart';
// import 'package:flutter_nhom2/my_classroom.dart';
// import 'package:flutter_nhom2/my_welcome.dart';
// import 'package:flutter_nhom2/profile_login.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: MyHomePage(),
      // home: MyPlace(),
      // home: MyClassroom(),
      // home: ChangeColorApp(),
      // home: CounterApp(),
      // home: FormLogin(),
      // home: FormRegister(),
      // home: FormBmi(),
      // home: FormFeedback(),
      // home: MyProduct(),
      // home: NewsListScreen(),
      // home: ProfileLogin(),
      home: HomeMenu(),
    );
  }
}