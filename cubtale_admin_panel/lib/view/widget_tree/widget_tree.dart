import 'package:cubtale_admin_panel/view/home/home_page.dart';
import 'package:cubtale_admin_panel/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class WidgetTree extends StatelessWidget {
   WidgetTree({super.key});

  var box = Hive.box<Map<String,dynamic>>("user_information");

  @override
  Widget build(BuildContext context) {
    if(box.isEmpty) {
      return const LoginScreen();
    } else {
      return const HomeScreen();
    }
  }
}
