



import 'package:cubtale_admin_panel/core/Theme/bloc/theme_event.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';


class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.light){
    on<ThemeChanged>((event, emit){
      emit(event.isDark ? ThemeMode.dark : ThemeMode.light);
       Hive.box<bool>("isDark").put(0, event.isDark);
      print(event.isDark);
    });
  }
}