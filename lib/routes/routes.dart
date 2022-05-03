import 'package:app_antibioticos/screens/backpack_decision.dart';
import 'package:flutter/material.dart';

import 'package:app_antibioticos/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'ranking': (_) => const Ranking(),
  'home': (_) => const HomeScreen(),
  'backpack': (_) => const BackpackDecisionScreen()
};
