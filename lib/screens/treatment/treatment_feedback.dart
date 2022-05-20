import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/screens/screens.dart';

class TreatmentFeedback extends StatefulWidget {
  const TreatmentFeedback({Key? key, required this.selectedMedicines})
      : super(key: key);

  final List selectedMedicines;

  @override
  State<TreatmentFeedback> createState() => _TreatmentFeedbackState();
}

class _TreatmentFeedbackState extends State<TreatmentFeedback> {
  List treatmentFeedback = [];
  List feedbackToUser = [];

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
    fillFeedbackToUser();
    //En caso de que sea el tratamiento empirico (1ª vez)
    if (idTreatmentQuestion == 1) {
      setNewLifeFirstTreatment();
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Feedback Tratamiento Empirico'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              CardViewTreatmentFeedback(treatmentFeedback: feedbackToUser),
              ElevatedButton(
                onPressed: () {
                  idTreatmentQuestion++;
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
              CardViewTreatmentFeedback(treatmentFeedback: feedbackToUser),
              ElevatedButton(
                onPressed: () {
                  idTreatmentQuestion--;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FinalScreen(),
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

  void fillFeedbackToUser() {
    for (int i = 0; i < treatmentFeedback.length; i++) {
      for (int j = 0; j < widget.selectedMedicines.length; j++) {
        if (treatmentFeedback[i]["antibiotico"] ==
            widget.selectedMedicines[j]["antibiotico"]) {
          feedbackToUser.add(treatmentFeedback[i]);
        }
      }
    }
  }

  void setNewLifeFirstTreatment() {
    int vidaFirst = 0;
    for (int i = 0; i < feedbackToUser.length; i++) {
      int restar = int.parse(feedbackToUser[i]["vida"]);
      vidaFirst = vidaFirst + restar;
    }
    if (vidaFirst > 20) {
      vidaJugador = vidaJugador - 0.2;
    } else {
      double vidaFinal = 0;
      vidaFinal = vidaFirst / 100;
      vidaJugador = vidaJugador - vidaFinal;
    }
  }
}
