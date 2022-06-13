import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.cyan;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Color primario

    primaryColor: Colors.cyan,
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 17.0, color: Colors.black),
      bodyText1: TextStyle(fontSize: 17.0, color: Colors.black),
    ),

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
      toolbarHeight: 100,
    ),

    // TextButton Theme

    textButtonTheme:
        TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),

    // FloatingActionButtons
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary, elevation: 5),

    // ElevatedButtons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: Colors.cyan, shape: const StadiumBorder(), elevation: 0),
    ),
    //Inputs Theme
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      labelStyle: TextStyle(fontSize: 15, color: Colors.black),
    ),

    //Tooltip Theme
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      textStyle: const TextStyle(color: Colors.black, fontSize: 17),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(

      // Color primario
      primaryColor: Colors.indigo,

      // AppBar Theme
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: Colors.black);
}
