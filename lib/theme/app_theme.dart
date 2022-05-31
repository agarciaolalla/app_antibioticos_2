import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.cyan;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Color primario

    primaryColor: Colors.cyan,

    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 17.0,
      ),
    ),

    // AppBar Theme
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),

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
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(

      // Color primario
      primaryColor: Colors.indigo,

      // AppBar Theme
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: Colors.black);
}
