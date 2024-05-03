import 'package:cubtale_admin_panel/core/Theme/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorView extends StatefulWidget {
  const ErrorView({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeMode>(builder: (context, state) {
      final themeBloc = context.read<ThemeBloc>().state;
      return Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Card(
            color:
                themeBloc == ThemeMode.light ? Colors.white : const Color(0xff204c5c),
            elevation: 15,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 90,
                    height: 90,
                    child: Image.asset("assets/oops_icon.png")),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Oops",
                  style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: themeBloc == ThemeMode.light
                              ? const Color(0xff204c5c)
                              : const Color(0xffb8e6db))),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Something",
                  style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: themeBloc == ThemeMode.light
                              ? const Color(0xff204c5c)
                              : const Color(0xffb8e6db))),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Went Wrong !",
                  style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: themeBloc == ThemeMode.light
                              ? const Color(0xff204c5c)
                              : const Color(0xffb8e6db))),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                    ),
                                    side: BorderSide(
                                        color:
                                            Colors.redAccent.withOpacity(0.5),
                                        width: 3)))),
                    child: Text(
                      "Try Again",
                      style: GoogleFonts.aBeeZee(
                          textStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.6))),
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
