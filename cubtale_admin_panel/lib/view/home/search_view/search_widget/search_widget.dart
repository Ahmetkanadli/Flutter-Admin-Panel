import 'package:cubtale_admin_panel/core/Theme/bloc/theme_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

Widget SearcByIdWiddget (String fieldName,String description,
    String secondFieldName, String secondDescription, BuildContext context
    ){

  double width = MediaQuery.of(context).size.width;
  return BlocBuilder<ThemeBloc,ThemeMode>(
    builder: (context,state) {
      final themeBloc = context.read<ThemeBloc>().state;
      return Row(
        children: [
          Text(
            fieldName,
            style: GoogleFonts.aBeeZee(
                textStyle : TextStyle(
                  fontSize: width < 650 ? 10 :
                  width < 1100 ? 12 : 15,
                  fontWeight: FontWeight.w300,
                  color: themeBloc == ThemeMode.light ? Colors.black.withOpacity(0.5) : Colors.white,
                )
            ),
          ),
          SizedBox(
            width: width < 650 ? 10 :
            width < 800 ? 15 : 15,
          ),
          Text(
              description,
            style: GoogleFonts.aBeeZee(
                textStyle : TextStyle(
                  fontSize: width < 650 ? 12 :
                  width < 1100 ? 13 : 18,
                  fontWeight: FontWeight.normal,
                  color: themeBloc == ThemeMode.light ? Colors.black.withOpacity(0.5) : Colors.white,
                )
            ),
          ),
          const Spacer(),
          Text(
            secondFieldName,
            style: GoogleFonts.aBeeZee(
                textStyle : TextStyle(
                  fontSize: width < 600 ? 10 :
                width < 1100 ? 12 : 15,
                  fontWeight: FontWeight.w300,
                  color: themeBloc == ThemeMode.light ? Colors.black.withOpacity(0.5) : Colors.white,
                )
            ),
          ),
          SizedBox(
            width: width < 650 ? 10 :
                    width < 1100 ? 15 : 15,
          ),
          Text(
            secondDescription,
            style: GoogleFonts.aBeeZee(
                textStyle : TextStyle(
                  fontSize: width < 650 ? 12 :
                  width < 1100 ? 13 : 18,
                  fontWeight: FontWeight.normal,
                  color: themeBloc == ThemeMode.light ? Colors.black.withOpacity(0.5) : Colors.white,
                )
            ),
          )
        ],
      );
    }
  );
}