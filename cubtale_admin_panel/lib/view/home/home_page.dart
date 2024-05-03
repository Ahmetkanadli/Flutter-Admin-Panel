import 'package:cubtale_admin_panel/core/Theme/bloc/theme_bloc.dart';
import 'package:cubtale_admin_panel/view/home/widget/Cards.dart';
import 'package:cubtale_admin_panel/view/home/widget/appBar_widget.dart';
import 'package:cubtale_admin_panel/view/home/widget/bloc/dropDown_bloc.dart';
import 'package:cubtale_admin_panel/view/home/widget/bloc/dropDown_states.dart';
import 'package:cubtale_admin_panel/view/home/widget/today_new_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<ThemeBloc, ThemeMode>(builder: (context, state) {
      return Scaffold(
          backgroundColor:
              state == ThemeMode.light ? Colors.white : Color(0xff101c34),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    BlocBuilder<DropDownBloc, DropDownState>(
                        builder: (context, state) {
                      return ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 80,
                              maxHeight: state.isPressed ? 250 : 100,
                              maxWidth: width,
                              minWidth: width),
                          child: HomeAppBarWidget(context));
                    }),
                    Center(
                      child: Column(
                        children: [
                          width < 1000
                              ? Column(
                                  children: [
                                    const SizedBox(
                                      height: 80,
                                    ),
                                    TodayNewUser(context),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Cards("DUMMUY CARD 1", context),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Cards("DUMMUY CARD 2", context),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Cards("DUMMUY CARD 3", context)
                                  ],
                                )
                              : Column(
                                  children: [
                                    const SizedBox(
                                      height: 80,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TodayNewUser(context),
                                        Cards("DUMMUY CARD 1", context),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Cards("DUMMUY CARD 3", context),
                                        Cards("DUMMUY CARD 3", context),
                                      ],
                                    )
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ));
    });
  }
}
