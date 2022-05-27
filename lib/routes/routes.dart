import 'package:flutter/material.dart';

import 'package:app_antibioticos/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'ranking': (_) => const Ranking(),
  'login': (_) => const Login(),
  'home': (_) => const HomeScreen(),
  'diagnostic': (_) => const DiagnosticScreen(),
  'treatment': (_) => const FirstTreatmentScreen(),
  'st': (_) => const SecondTreatmentScreen(),
  'final': (_) => const FinalScreen(),
};
