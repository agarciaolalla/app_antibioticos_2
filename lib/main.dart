import 'package:flutter/material.dart';

import 'package:app_antibioticos/theme/app_theme.dart';
import 'package:app_antibioticos/routes/routes.dart';

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
      routes: appRoutes,
      initialRoute: 'initialrequest',
    );
  }
}
