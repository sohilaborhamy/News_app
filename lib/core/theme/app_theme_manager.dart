import 'package:flutter/material.dart';
import 'package:new_app/core/theme/colors_app.dart';



abstract class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsApp.backgroundColorLight,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorsApp.backgroundColorLight,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorsApp.primaryColorLight
      )
      
    ),
  
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsApp.primaryColorLight,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
    ),
  
  );
}