import 'package:flutter/material.dart';

import 'package:app_antibioticos/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'ranking': (_) => const Ranking(),
  'login': (_) => const Login(),
  'home': (_) => const HomeScreen(),
  'backpack': (_) => const BackpackDecisionScreen(),
  'firstquestion': (_) => const FirstQuestion(),
  'secondquestion': (_) => const SecondQuestionScreen(),
  'thirdquestion': (_) => const ThirdQuestionScreen(),
  'final': (_) => const FinalScreen(),
};
