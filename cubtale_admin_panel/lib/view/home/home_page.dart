
import 'package:cubtale_admin_panel/view/home/widget/Cards.dart';
import 'package:cubtale_admin_panel/view/home/widget/appBar_widget.dart';
import 'package:cubtale_admin_panel/view/home/widget/today_new_user.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [

          Center(
            child: SingleChildScrollView(
              child: width < 1000 ? Column(
                children: [
                  ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: 100,
                          maxHeight: 100,
                          maxWidth: width,
                          minWidth: width
                      ),
                      child: HomeAppBarWidget(context)),
                  const SizedBox(height: 80,),
                  TodayNewUser(context),
                  const  SizedBox(height: 30,),
                  Cards("DUMMUY CARD 1", context),
                  const SizedBox(height: 30,),
                  Cards("DUMMUY CARD 2", context),
                  const SizedBox(height: 30,),
                  Cards("DUMMUY CARD 3", context)
                ],
              ) :
              Column(
                children: [
                  ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: 100,
                          maxHeight: 100,
                          maxWidth: width,
                          minWidth: width
                      ),
                      child: HomeAppBarWidget(context)),
                  const SizedBox(height: 80,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TodayNewUser(context),
                      Cards("DUMMUY CARD 1", context),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Cards("DUMMUY CARD 3", context),
                      Cards("DUMMUY CARD 3", context),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
