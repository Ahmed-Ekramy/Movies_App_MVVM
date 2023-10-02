import 'package:flutter/material.dart';

import 'package:movies_app1/core/Components.dart';
import '../feature/detail_screen/presentation/pages/detail_screen.dart';
import '../feature/home/presentation/pages/screens/home_layout.dart';
import '../feature/home/presentation/pages/screens/new_screen.dart';
import '../feature/home/presentation/pages/screens/top_rated.dart';

class Routes {
  static const String home = "/";
  static const String newScreen = "newScreen";
  static const String topRated = "topRated";
  // static const String detailScreen = "detailScreen";
}

class AppRoutes {
  static MaterialPageRoute onGenrate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeLayout());

      case Routes.newScreen:
        return MaterialPageRoute(builder: (context) => const NewScreen());
      case Routes.topRated:
        return MaterialPageRoute(builder: (context) => const TopRated());
      // case Routes.detailScreen:
      //
      //   return MaterialPageRoute(builder: (context) =>  DetailScreen());

      default:
        return MaterialPageRoute(builder: (context) => unDefineRoute());
    }
  }
}
