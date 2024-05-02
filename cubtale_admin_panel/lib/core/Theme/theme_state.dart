import 'package:flutter/material.dart';


ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
      //color: Color(0xffb8e6db),
    backgroundColor: Color(0xffb8e6db)
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.black.withOpacity(0.5),
    ),
      headline2: TextStyle(
        color: Colors.black.withOpacity(0.5),
      ),
      headline3: TextStyle(
        color: Colors.black.withOpacity(0.5),
      )
  )
);

ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
      //color: Colors.teal,
          backgroundColor: Color(0xff101c34),

  ),
    textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.white.withOpacity(0.5),
        ),
        headline2: TextStyle(
          color: Colors.white.withOpacity(0.5),
        ),
        headline3: TextStyle(
          color: Colors.white.withOpacity(0.5),
        )
    )
);