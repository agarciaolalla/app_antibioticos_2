import 'package:flutter/material.dart';

import 'package:app_antibioticos/html/html.dart';
import 'package:app_antibioticos/screens/screens.dart';

class LastTreatmentFeedbackWidget extends StatelessWidget {
  const LastTreatmentFeedbackWidget({
    Key? key,
    required this.lastTreatmentFeedback,
  }) : super(key: key);

  final String lastTreatmentFeedback;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: LastTreatmentFeedbackHtml(feedback: lastTreatmentFeedback),
          ),
          FloatingActionButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TreatmentScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
