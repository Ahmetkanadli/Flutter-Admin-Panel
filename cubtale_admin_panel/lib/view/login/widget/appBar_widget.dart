import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget AppBarWidget (BuildContext context){

  return Stack(
    children: [
      // Sol tarafta Border Eğimi vermek için yazıldı
      Container(
        width: MediaQuery.of(context).size.width/2,
        height: 100,
        decoration: const BoxDecoration(
          color: Color(0xffb8e6db),
        ),
      ),
      Column(
        children: [
          AppBar(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30)
                )
            ),
            toolbarHeight: 80,
            elevation: 0,
            backgroundColor:const Color(0xffb8e6db),
            title: Row(
              children: [
                const SizedBox(
                  width: 6,
                ),

                SizedBox(
                  height: 60,
                  width: 60,
                  child: AspectRatio(
                      aspectRatio: 1/1,
                      child: Image.asset("assets/cubtale logo1.png",)),
                ),
                const SizedBox(
                  width: 14,
                ),
                SizedBox(
                    height:  70,
                    width: 150,
                    child: AspectRatio(
                        aspectRatio: 113 / 540,
                        child: Image.asset("assets/Cubtale watermark.png",)))
              ],
            ),
            actions: [
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xffd7f1ed),
                    borderRadius: BorderRadius.all(
                        Radius.circular(15))),
                height: 50,
                width: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset("assets/darkmode_icon.png")),
                    Text(
                      "Dark Mode",
                      style: GoogleFonts.aBeeZee(
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.5)
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width:30,
              )
            ],

          ),
        ],
      ),
      Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Expanded(
            child: Container(
              height: 80,
              decoration: const BoxDecoration(
                // AppBar ' ın Sol tarafına shape vermek için
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  //topRight: Radius.circular(toolbarWidth * 0.2),
                ),
                color: Colors.white,
              ),
            ),
          ),
        ],
      )
    ],
  );
}