import 'package:flutter/material.dart';
import 'package:app_antibioticos/theme/app_theme.dart';
import 'package:app_antibioticos/screens/screens.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      title: 'App Antibióticos',
      //home: const Ranking(),
      home: const HomeScreen(),
    );
  }
}
