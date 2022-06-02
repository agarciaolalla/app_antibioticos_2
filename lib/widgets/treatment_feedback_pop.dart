import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TreatmentFeedbackPop extends StatelessWidget {
  const TreatmentFeedbackPop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Text("Feedback Tratamiento Empírico",
                style: TextStyle(
                  fontSize: 25,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  backgroundColor: Colors.cyan,
                )),
          ]),
        ),
        CardViewTreatmentFeedback(treatmentFeedback: firstTreatmentFeedback),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              'Cerrar',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
