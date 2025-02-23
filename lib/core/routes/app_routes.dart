import 'package:flutter/material.dart';


import '../../feauters/home/view/home_view.dart';
import '../../feauters/splash/splash_screen.dart';
import 'name_routes_screen.dart';

abstract class AppRoutes {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case ScreenRouteName.initial:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);
             case ScreenRouteName.homeView:
        return MaterialPageRoute(
            builder: (context) => const HomeView(), settings: settings);
      
      
            
            default :
             return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings); 
    }
  }
}
