import 'package:flutter/material.dart';

import 'package:app_antibioticos/html/html.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

class DiagnosticFeedbackDialog extends StatelessWidget {
  const DiagnosticFeedbackDialog({
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
            child: Text(
              'Feedback Diagnóstico',
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
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
      content: SingleChildScrollView(
        child: DiagnosticFeedbackHtml(feedback: diagnosticFeedback),
      ),
    );
  }
}
