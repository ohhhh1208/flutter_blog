// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../pages/main_tab_navigator.dart';
import '../pages/splash_page.dart';
import '../widget/page_route_anim.dart';

part 'app_routes.dart';

class AppPages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return NoAnimRouteBuilder(SplashPage());
      case AppRoutes.mainTab:
        return NoAnimRouteBuilder(MainTabNavigator());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
