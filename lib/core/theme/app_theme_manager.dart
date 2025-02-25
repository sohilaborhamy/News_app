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
    textTheme: const TextTheme(headlineSmall: TextStyle(
      color: ColorsApp.primaryColorLight
    ),
    titleMedium: TextStyle(
      color: ColorsApp.primaryColorLight
    ),
     bodyMedium: TextStyle(
      color: ColorsApp.primaryColorLight
    )
    ),
  
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsApp.primaryColorLight,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorsApp.backgroundColorLight
      )
    ),
    textTheme: const TextTheme(headlineSmall: TextStyle(
      color: ColorsApp.backgroundColorLight
    ),
     titleMedium: TextStyle(
      color: ColorsApp.backgroundColorLight
    ),
    bodyMedium: TextStyle(
      color: ColorsApp.backgroundColorLight
    )
    
    ),
   
  
  );
}