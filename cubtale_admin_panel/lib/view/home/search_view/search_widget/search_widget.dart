import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Widget SearcByIdWiddget (String fieldName,String description,
    String secondFieldName, String secondDescription, BuildContext context
    ){

  double width = MediaQuery.of(context).size.width;
  return Row(
    children: [
      Text(
        fieldName,
        style: GoogleFonts.aBeeZee(
            textStyle : TextStyle(
              fontSize: width < 650 ? 10 :
              width < 1100 ? 12 : 15,
              fontWeight: FontWeight.w300,
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
            )
        ),
      )
    ],
  );
}