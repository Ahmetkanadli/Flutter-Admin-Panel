import 'package:cubtale_admin_panel/core/Theme/bloc/theme_bloc.dart';
import 'package:cubtale_admin_panel/core/Theme/bloc/theme_event.dart';
import 'package:cubtale_admin_panel/view/home/home_page.dart';
import 'package:cubtale_admin_panel/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class WidgetTree extends StatelessWidget {
   WidgetTree({super.key});

  var box = Hive.box<Map<String,dynamic>>("user_information");
  var isDark = Hive.box<bool>("isDark").get(0);
  @override
  Widget build(BuildContext context) {



    if(box.isEmpty) {
      return const LoginScreen();
    } else {
      return BlocBuilder<ThemeBloc,ThemeMode>(
        builder: (context,state) {
          print("isDark : $isDark");
          final themeBloc = context.read<ThemeBloc>().state;
          print("context : ${themeBloc}");
          isDark == false ? context.read<ThemeBloc>().add(ThemeChanged(false)):
          context.read<ThemeBloc>().add(ThemeChanged(true));
          return const LoginScreen();
        }
      );
    }
  }
}
