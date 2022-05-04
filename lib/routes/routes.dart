import 'package:flutter/material.dart';

import 'package:app_antibioticos/screens/screens.dart';
import 'package:app_antibioticos/screens/pruebahome.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'ranking': (_) => const Ranking(),
  'home': (_) => const HomeScreen(),
  'firstquestion': (_) => const FirstQuestion(),
  'prueba': (_) => const Prueba()
};
