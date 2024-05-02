
import 'package:cubtale_admin_panel/view/home/search_view/search_page.dart';
import 'package:cubtale_admin_panel/view/home/widget/bloc/dropDown_bloc.dart';
import 'package:cubtale_admin_panel/view/home/widget/bloc/dropDown_events.dart';
import 'package:cubtale_admin_panel/view/home/widget/bloc/dropDown_states.dart';
import 'package:cubtale_admin_panel/view/login/bloc/login_bloc.dart';
import 'package:cubtale_admin_panel/view/login/bloc/login_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

Widget HomeAppBarWidget(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  print(width);
  return BlocBuilder<DropDownBloc,DropDownState>(
    builder: (context,state) {
      return Stack(
        children: [
          // Sol tarafta Border Eğimi vermek için yazıldı
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xffb8e6db),
                ),
              ),
              const Spacer(),
              Container(
                width: width < 1000 ?width/4.5 : 222,
                height: state.isPressed ? 200 : 20,
                decoration: const BoxDecoration(
                  color: Color(0xffb8e6db),
                ),
              ) ,
            ],
          ),
          Column(
            children: [
              AppBar(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30))),
                toolbarHeight: 80,
                elevation: 0,
                backgroundColor: const Color(0xffb8e6db),
                actions: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 6,
                      ),
                      SizedBox(
                        height: 60,
                        width: width < 550
                            ? 35
                            : width < 700
                                ? 40
                                : 60,
                        child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.asset(
                              "assets/cubtale logo1.png",
                            )),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      SizedBox(
                          height: 70,
                          width: width < 555
                              ? 80
                              : width < 680
                                  ? 83
                                  : 150,
                          child: AspectRatio(
                              aspectRatio: 113 / 540,
                              child: Image.asset(
                                "assets/Cubtale watermark.png",
                              ))),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SearchPage(
                                          searchType: 'Search By Email',
                                          searchTitle: 'Email',
                                        )));
                          },
                          child: Text(
                            "Search By Email",
                            style: GoogleFonts.aBeeZee(
                                textStyle: TextStyle(
                                    fontSize: width < 600
                                        ? 10
                                        : width < 650
                                            ? 12
                                            : width < 800
                                                ? 15
                                                : 20)),
                          )),
                      Image.asset("assets/vertical divider.png"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SearchPage(
                                      searchType: 'Search By ID',
                                      searchTitle: 'ID',
                                    )));
                          },
                          child: Text(
                            "Search by ID",
                            style: GoogleFonts.aBeeZee(
                                textStyle: TextStyle(
                                    fontSize: width < 600
                                        ? 10
                                        : width < 650
                                            ? 12
                                            : width < 800
                                                ? 15
                                                : 20)),
                          )),
                      Image.asset("assets/vertical divider.png"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SearchPage(
                                      searchType: 'Search By Date',
                                      searchTitle: 'Date',
                                    )));
                          },
                          child: Text(
                            "Search by Date",
                            style: GoogleFonts.aBeeZee(
                                textStyle: TextStyle(
                                    fontSize: width < 600
                                        ? 10
                                        : width < 650
                                            ? 12
                                            : width < 800
                                                ? 15
                                                : 20)),
                          )),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    height: 20,
                    width: 20,
                    child:  GestureDetector(
                            onTap: (){
                              //DropDownMenu(context);
                              if(state.isPressed) context.read<DropDownBloc>().add(IsPressedEvent(false));
                              else context.read<DropDownBloc>().add(IsPressedEvent(true));
                            },
                            child: Image.asset("assets/menu_burger.png"))


                  ),
                  const SizedBox(
                    width: 30,
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
                  width: width,
                  decoration: const BoxDecoration(
                    // AppBar ' ın Sol tarafına shape vermek için
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      //topRight: Radius.circular(toolbarWidth * 0.2),
                    ),
                    color: Colors.white,
                  ),
                  child: BlocBuilder<DropDownBloc,DropDownState>(
                    builder: (context,state){
                      return Stack(
                        fit: StackFit.loose,
                        children: [
                          state.isPressed ? DropDownMenu(context) : const Center()
                        ],
                      );
                    },
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

Widget DropDownMenu(BuildContext context){
  
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  String acc_name = '';
  String role = '';

  var _user = Hive.box<Map<String,dynamic>>("user_information");
  List userList = _user.get(0)!.values.toList();

  print(_user.get(0)!.values);
  return BlocBuilder<LoginBloc,LoginState>(
    builder: (context,state){
      return  Row(
        //crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //SizedBox(width: width/1.4,),
          SizedBox(

            child: Container(
              width: width < 1000 ?width/4.5 : 222,
              height: height/4,
              decoration:const  BoxDecoration(
                  color: Color(0xffb8e6db),
                borderRadius: BorderRadius.only(
                    bottomLeft : Radius.circular(15),
                  bottomRight: Radius.circular(15)
                )
              ),
              child: Column(

                children: [

                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.transparent,
                    child: Image.asset("assets/profile_image_light.png"),
                  ),
                  SizedBox(height: 20,),
                  Text(
                      "Name    :    ${userList[2]} ",
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: width < 600 ? 13 : 16,
                      )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text("Role    :    ${userList[4]} ")
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
