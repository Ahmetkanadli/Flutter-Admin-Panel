
import 'package:cubtale_admin_panel/common/routes.dart';
import 'package:cubtale_admin_panel/view/home/home_page.dart';
import 'package:cubtale_admin_panel/view/login/login_screen.dart';
import 'package:flutter/material.dart';



class AppPages{
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route : AppRoutes.INITIAL,
          page : const LoginScreen(),
      ),
      PageEntity(
          route : AppRoutes.HOME,
          page : const HomeScreen(),
      ),

    ];
  }


  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings){
    if(settings.name != null){
      var result = routes().where((element) => element.route == settings.name);

      if(result.isNotEmpty){
        return MaterialPageRoute(builder: (_) => result.first.page, settings: settings);
      }

    }
    return MaterialPageRoute(builder: (_)=> const LoginScreen(),settings: settings);
  }
}



class PageEntity{
  String route;
  Widget page;

  PageEntity({required this.route, required this.page});
}