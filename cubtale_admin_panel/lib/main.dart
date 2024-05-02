

import 'dart:async';

import 'package:cubtale_admin_panel/view/home/home_page.dart';
import 'package:cubtale_admin_panel/view/home/search_view/search_bloc/search_bloc.dart';
import 'package:cubtale_admin_panel/view/home/widget/bloc/dropDown_bloc.dart';
import 'package:cubtale_admin_panel/view/login/bloc/login_bloc.dart';
import 'package:cubtale_admin_panel/view/login/login_screen.dart';
import 'package:cubtale_admin_panel/view/widget_tree/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> setupHive() async {

   await Hive.initFlutter();
   await Hive.openBox<Map<String,dynamic>>("user_information");
}


void startScheduledTask() {
  // Her 14 günde bir Hive veritabanını temizle
  const Duration cleaningInterval = Duration(days: 14);

  Timer.periodic(cleaningInterval, (timer) {
    var box = Hive.box<Map<String,dynamic>>('user_information');
    box.clear();
  });
}

Future<void> main() async {
  await setupHive();
  runApp(const MyApp());
  startScheduledTask();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginBloc()),
          BlocProvider(create: (context) => SearchBloc()),
          BlocProvider(create: (context) => DropDownBloc()),
        ],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    elevation: 0, backgroundColor: Colors.white,
                ),
                useMaterial3: true),
            home: WidgetTree(),
          ),
        ));
  }
}
