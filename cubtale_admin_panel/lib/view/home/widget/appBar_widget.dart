import 'package:cubtale_admin_panel/core/Theme/bloc/theme_bloc.dart';
import 'package:cubtale_admin_panel/view/home/search_view/search_page.dart';
import 'package:cubtale_admin_panel/view/home/widget/bloc/dropDown_bloc.dart';
import 'package:cubtale_admin_panel/view/home/widget/bloc/dropDown_events.dart';
import 'package:cubtale_admin_panel/view/home/widget/bloc/dropDown_states.dart';
import 'package:cubtale_admin_panel/view/login/bloc/login_bloc.dart';
import 'package:cubtale_admin_panel/view/login/bloc/login_states.dart';
import 'package:cubtale_admin_panel/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

Widget HomeAppBarWidget(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  return BlocBuilder<DropDownBloc, DropDownState>(builder: (context, state) {
    final themeBloc = context.read<ThemeBloc>().state;
    return BlocBuilder<DropDownBloc, DropDownState>(builder: (context, state) {
      return Stack(
        children: [
          // Sol tarafta Border Eğimi vermek için yazıldı
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 100,
                decoration: BoxDecoration(
                  color: themeBloc == ThemeMode.light
                      ? const Color(0xffb8e6db)
                      : const Color(0xff204c5c),
                ),
              ),
              const Spacer(),
              Container(
                width: width < 1000 ? width / 4.5 : 222,
                height: state.isPressed ? 250 : 10,
                decoration: BoxDecoration(
                  color: themeBloc == ThemeMode.light
                      ? const Color(0xffb8e6db)
                      : const Color(0xff204c5c),
                ),
              ),
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
                backgroundColor: themeBloc == ThemeMode.light
                    ? const Color(0xffb8e6db)
                    : const Color(0xff204c5c),
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
                  const Spacer(),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {

                            context.read<DropDownBloc>().add(SearchTypeEvent('Search By Email'));
                            context.read<DropDownBloc>().add(SearchTitleEvent('Email'));

                            Navigator.of(context).pushNamed('/search');
                          },
                          child: Text(
                            "Search By Email",
                            style: GoogleFonts.aBeeZee(
                                textStyle: TextStyle(
                                    color: themeBloc == ThemeMode.light
                                        ? Colors.black.withOpacity(0.5)
                                        : Colors.white,
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

                            context.read<DropDownBloc>().add(SearchTypeEvent('Search By ID'));
                            context.read<DropDownBloc>().add(SearchTitleEvent('ID'));

                            Navigator.of(context).pushNamed('/search');
                          },
                          child: Text(
                            "Search by ID",
                            style: GoogleFonts.aBeeZee(
                                textStyle: TextStyle(
                                    color: themeBloc == ThemeMode.light
                                        ? Colors.black.withOpacity(0.5)
                                        : Colors.white,
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

                            context.read<DropDownBloc>().add(SearchTypeEvent('Search By Date'));
                            context.read<DropDownBloc>().add(SearchTitleEvent('Date'));

                            Navigator.of(context).pushNamed('/search');
                          },
                          child: Text(
                            "Search by Date",
                            style: GoogleFonts.aBeeZee(
                                textStyle: TextStyle(
                                    color: themeBloc == ThemeMode.light
                                        ? Colors.black.withOpacity(0.5)
                                        : Colors.white,
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
                      child: GestureDetector(
                          onTap: () {
                            //DropDownMenu(context);
                            if (state.isPressed) {
                              context
                                  .read<DropDownBloc>()
                                  .add(IsPressedEvent(false));
                            } else {
                              context
                                  .read<DropDownBloc>()
                                  .add(IsPressedEvent(true));
                            }
                          },
                          child: Image.asset("assets/menu_burger.png"))),
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
                child: BlocBuilder<ThemeBloc, ThemeMode>(
                    builder: (context, state) {
                      final themeBloc = context.read<ThemeBloc>().state;
                      return Container(
                        height: 80,
                        width: width,
                        decoration: BoxDecoration(
                          // AppBar ' ın Sol tarafına shape vermek için
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            //topRight: Radius.circular(toolbarWidth * 0.2),
                          ),
                          color: themeBloc == ThemeMode.light
                              ? Colors.white
                              : const Color(0xff101c34),
                        ),
                        child: BlocBuilder<DropDownBloc, DropDownState>(
                          builder: (context, state) {
                            return Stack(
                              //fit: StackFit.loose,
                              children: [
                                state.isPressed
                                    ? DropDownMenu(context)
                                    : const Center()
                              ],
                            );
                          },
                        ),
                      );
                    }),
              ),
            ],
          )
        ],
      );
    });
  });
}

Widget DropDownMenu(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  var user = Hive.box<Map<String, dynamic>>("user_information");
  List userList = user.get(0)!.values.toList();

  return BlocBuilder<ThemeBloc, ThemeMode>(builder: (context, state) {
    final themeBloc = context.read<ThemeBloc>().state;
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Row(
          //crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //SizedBox(width: width/1.4,),
            SizedBox(
              child: Container(
                width: width < 1000 ? width / 4.5 : 222,
                height: height / 2.9,
                decoration: BoxDecoration(
                    color: themeBloc == ThemeMode.light
                        ? const Color(0xffb8e6db)
                        : const Color(0xff204c5c),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.transparent,
                      child: Image.asset("assets/profile_image_light.png"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Name    :    ${userList[2]} ",
                      style: GoogleFonts.aBeeZee(
                          textStyle: TextStyle(
                            color: themeBloc == ThemeMode.light
                                ? Colors.black.withOpacity(0.5)
                                : Colors.white,
                            fontSize: width < 600 ? 13 : 16,
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Role    :    ${userList[4]} ",
                      style: GoogleFonts.aBeeZee(
                          textStyle: TextStyle(
                            color: themeBloc == ThemeMode.light
                                ? Colors.black.withOpacity(0.5)
                                : Colors.white,
                            fontSize: width < 600 ? 13 : 16,
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const LoginScreen()));
                              user.clear();
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    themeBloc == ThemeMode.light
                                        ? Colors.white
                                        : Colors.grey.shade200),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                        ),
                                        side: BorderSide(
                                            color: Colors.redAccent
                                                .withOpacity(0.5),
                                            width: 3)))),
                            child: Text(
                              "Logout",
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: 10)),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  });
}