import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app_antibioticos/utilidades/constantes.dart';

class TreatmentFeedbackDialog extends StatelessWidget {
  const TreatmentFeedbackDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('Feedback Tratamiento Empirico'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            ),
          )
        ],
      ),
      content: SizedBox(
        height: 600,
        width: 600,
        child: SingleChildScrollView(
          child: CardViewTreatmentFeedback(
              treatmentFeedback: firstTreatmentFeedback),
        ),
      ),
    );
  }
}
