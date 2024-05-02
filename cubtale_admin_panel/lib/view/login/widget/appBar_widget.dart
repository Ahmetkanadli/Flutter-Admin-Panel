import 'package:cubtale_admin_panel/core/Theme/bloc/theme_bloc.dart';
import 'package:cubtale_admin_panel/core/Theme/bloc/theme_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

Widget AppBarWidget (BuildContext context){

  return BlocBuilder<ThemeBloc,ThemeMode>(
    builder: (context,state) {
      final themeBloc = context.read<ThemeBloc>().state;
      return Stack(

        children: [
          // Sol tarafta Border Eğimi vermek için yazıldı
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/2,
                height: 100,
                decoration: BoxDecoration(
                  color: state == ThemeMode.light ? Color(0xffb8e6db) : Color(0xff204c5c),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/2,
                height: 80,
                decoration: BoxDecoration(
                  color: state == ThemeMode.light ? Colors.white :  Color(0xff101c34),
                ),
              ),
            ],
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
                backgroundColor: state == ThemeMode.light ? Color(0xffb8e6db) : Color(0xff204c5c),
                elevation: 0,
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
                  GestureDetector(
                    onTap: (){
                      if(context.read<ThemeBloc>().state == ThemeMode.dark){
                        context.read<ThemeBloc>().add(ThemeChanged(false));
                      }
                      else{
                        context.read<ThemeBloc>().add(ThemeChanged(true));
                      }
                    },
                    child: Container(
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
                              child:state == ThemeMode.light ?
                              Image.asset("assets/darkmode_icon.png")
                                  :Image.asset("assets/lightmode_icon.png")),
                          Text(
                            state == ThemeMode.light ? "Dark Mode" : "Light Mode",
                            style: GoogleFonts.aBeeZee(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    //color: Colors.black.withOpacity(0.5)
                                )),
                          ),
                        ],
                      ),
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
                  decoration: BoxDecoration(
                    // AppBar ' ın Sol tarafına shape vermek için
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      //topRight: Radius.circular(toolbarWidth * 0.2),
                    ),
                    color: themeBloc == ThemeMode.light ? Colors.white : Color(0xff101c34),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    }
  );
}