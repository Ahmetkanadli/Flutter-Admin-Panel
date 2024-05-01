
import 'package:cubtale_admin_panel/view/home/widget/appBar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomeAppBarWidget(context),
          Column(
            children: [
              SizedBox(height: 120,),
              Center(
                child: Text("Selam"),
              )
            ],
          )
        ],
      )
    );
  }
}
