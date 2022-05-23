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
  int vidaPerdida = 0;
  String mostrarVidaPerdida = "";
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
              const Life(),
              CardViewTreatmentFeedback(treatmentFeedback: feedbackToUser),
              Text(mostrarVidaPerdida),
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
      setNewLifeSecondTreatment();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Feedback Tratamiento Dirigido'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              const Life(),
              CardViewTreatmentFeedback(treatmentFeedback: feedbackToUser),
              Text(mostrarVidaPerdida),
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
    for (int i = 0; i < feedbackToUser.length; i++) {
      for (int j = 0; j < widget.selectedMedicines.length; j++) {
        if (feedbackToUser[i]["antibiotico"] ==
            widget.selectedMedicines[j]["antibiotico"]) {
          feedbackToUser[i]["dias"] = widget.selectedMedicines[j]["dias"];
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
      vidaPerdida = 20;
    } else {
      double vidaFinal = 0;
      vidaFinal = vidaFirst / 100;
      vidaJugador = vidaJugador - vidaFinal;
      vidaPerdida = vidaFirst;
      ajustarVidaPerdida();
    }
  }

  void setNewLifeSecondTreatment() {
    double vidaSecond = 0.0;
    for (int i = 0; i < feedbackToUser.length; i++) {
      if (feedbackToUser[i]["activo"] == 'No') {
        vidaSecond = vidaSecond + 0.2;
      } else {
        if (feedbackToUser[i]["via"] == 'Vía Oral') {
          int dias = feedbackToUser[i]["dias"];
          int lastdias = int.parse(treatmentFeedback[0]["lastdias"]);

          if (dias < lastdias) {
            vidaSecond = vidaSecond + 0.1;
          } else {
            //No le penaliza la vida en este caso.
          }
        } else {
          int dias = feedbackToUser[i]["dias"];
          int lastdias = int.parse(treatmentFeedback[0]["lastdias"]);
          if (dias < lastdias) {
            vidaSecond = vidaSecond + 0.2;
          } else {
            vidaSecond = vidaSecond + 0.1;
          }
        }
      }
    }
    if (vidaSecond > 0.2) {
      vidaSecond = 0.2;
    }
    vidaJugador = vidaJugador - vidaSecond;
    vidaPerdida = (vidaSecond * 100).toInt();
    ajustarVidaPerdida();
  }

  void ajustarVidaPerdida() {
    if (vidaPerdida == 0) {
      mostrarVidaPerdida = "¡Genial! El paciente no ha perdido vida.";
    } else {
      mostrarVidaPerdida =
          "El paciente ha perdido un " + vidaPerdida.toString() + "% de vida";
    }
  }
}
