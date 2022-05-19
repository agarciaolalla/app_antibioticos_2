import 'package:app_antibioticos/screens/diagnostic/diagnostic.dart';
import 'package:app_antibioticos/screens/screens.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/widgets/widgets.dart';

class TreatmentFeedback extends StatefulWidget {
  const TreatmentFeedback({Key? key}) : super(key: key);

  @override
  State<TreatmentFeedback> createState() => _TreatmentFeedbackState();
}

class _TreatmentFeedbackState extends State<TreatmentFeedback> {
  List treatmentFeedback = [];

  @override
  void initState() {
    super.initState();
    getTreatmentFeedback();
  }

  Future getTreatmentFeedback() async {
    List returnlista = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/treatment_feedback"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnlista = data['treatment_feedback'];

      for (var i = 0; i < returnlista.length; i++) {
        if (returnlista[i]["idcaso"] == idcaso.toString()) {
          treatmentFeedback.add(returnlista[i]);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //En caso de que sea el tratamiento empirico (1ª vez)
    if (idTreatmentQuestion == 1) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Feedback Tratamiento Empirico'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              EmpiricalTreatmentFeedback(treatmentFeedback: treatmentFeedback),
              ElevatedButton(
                onPressed: () {
                  idTreatmentQuestion++;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FirstTreatmentScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Continuar',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      );
      //En caso de que sea el tratamiento dirigido (2ª vez)
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Feedback Tratamiento Dirigido'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              EmpiricalTreatmentFeedback(treatmentFeedback: treatmentFeedback),
              ElevatedButton(
                onPressed: () {
                  idTreatmentQuestion--;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondTreatmentScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Continuar',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
