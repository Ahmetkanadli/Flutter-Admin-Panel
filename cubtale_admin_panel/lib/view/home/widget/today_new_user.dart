import 'package:cubtale_admin_panel/view/home/widget/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget TodayNewUser(BuildContext context){
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Container(
    width: width < 1350 ? 490 : width /2.9,
    height: 250,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: Color(0xffb8e6db),
            width: 2
        )
    ),
    child: Column(
      children: [
        Text(
          "TODAY NEW USERS",
          style: GoogleFonts.aBeeZee(
              textStyle : TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              )
          ),
        ),
        Container(
            width: width < 1350 ? 450 : width /3,
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Color(0xffb8e6db).withOpacity(0.6), // Grid rengi (grid rengini buradan değiştirebilirsiniz)
                ],
              ),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        text(width,"Name","Email"),

                        text(width,"Name","Email")
                      ],
                    ),
                    Row(
                      children: [
                        text(width,"John Doe","johndoe@gmail.com"),
                        const Spacer(),
                        text(width,"John Doe","johndoe@gmail.com")
                      ],
                    ),
                    Divider(thickness: 1,color: Colors.grey.shade300,),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        text(width,"John Doe","johndoe@gmail.com"),
                        const Spacer(),
                        text(width,"John Doe","johndoe@gmail.com"),
                      ],
                    ),
                    Divider(thickness: 1,color: Colors.grey.shade300,),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        text(width,"John Doe","johndoe@gmail.com"),
                        const Spacer(),
                        text(width,"John Doe","johndoe@gmail.com"),
                      ],
                    ),
                    Divider(thickness: 1,color: Colors.grey.shade300,),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        text(width,"John Doe","johndoe@gmail.com"),
                        const Spacer(),
                        text(width,"John Doe","johndoe@gmail.com"),
                      ],
                    ),
                    Divider(thickness: 1,color: Colors.grey.shade300,),
                  ],
                ),
              ],
            )
        )
      ],
    ),
  );
}
