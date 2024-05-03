import 'package:cubtale_admin_panel/core/Theme/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Cards(String title, BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return BlocBuilder<ThemeBloc, ThemeMode>(builder: (context, state) {
    return Container(
      width: width < 1350 ? 490 : width / 2.9,
      height: 250,
      decoration: BoxDecoration(
          color: state == ThemeMode.light ? Colors.white : const Color(0xff182c3c),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xffb8e6db), width: 2)),
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.aBeeZee(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: state == ThemeMode.light
                        ? Colors.black.withOpacity(0.5)
                        : Colors.white)),
          ),
          Container(
            width: width < 1350 ? 450 : width / 3,
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: state == ThemeMode.light
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        const Color(0xffb8e6db).withOpacity(0.6),
                      ],
                    )
                  : LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xffb8e6db),
                        Colors.white.withOpacity(0.9),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  });
}
