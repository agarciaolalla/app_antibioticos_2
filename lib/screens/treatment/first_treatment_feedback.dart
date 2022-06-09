import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/screens/screens.dart';

class FirstTreatmentFeedback extends StatefulWidget {
  const FirstTreatmentFeedback({Key? key, required this.selectedMedicines})
      : super(key: key);

  final List selectedMedicines;
  @override
  State<FirstTreatmentFeedback> createState() => _FirstTreatmentFeedbackState();
}

class _FirstTreatmentFeedbackState extends State<FirstTreatmentFeedback> {
  List treatmentFeedback = [];
  List feedbackToUser = [];
  int vidaPerdida = 0;
  String mostrarVidaPerdida = "";
  String muerte = "El paciente ha muerto.";

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
    initialFill();
    setNewLifeFirstTreatment();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: SafeArea(
          child: Column(
            children: [
              const Text(
                "Tratamiento Empirico",
                style: TextStyle(
                    fontSize: 25, fontFamily: 'FjallaOne', color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.backpack_outlined),
                    tooltip: "Mochila",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const BackpackDialog();
                        },
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.info_outline),
                    tooltip: "Información Inicial",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const InitialInfoDialog();
                        },
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.comment_outlined),
                    tooltip: "Feedback Pregunta Diagnóstico",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const DiagnosticFeedbackDialog();
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            const Life(),
            CardViewTreatmentFeedback(treatmentFeedback: feedbackToUser),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                mostrarVidaPerdida,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setBackpackDosesFirstTreatment();
                if (vidaJugador <= 0) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return LooseScreen(informacion: muerte);
                  }), (Route<dynamic> route) => false);
                } else {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return const SecondTreatmentScreen();
                  }), (Route<dynamic> route) => false);
                }
              },
              child: const Text(
                'Continuar',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Añade el feedbacktoUser para mostrarlo en pantalla y te rellena el array CheckDays
  void initialFill() {
    for (int i = 0; i < treatmentFeedback.length; i++) {
      for (int j = 0; j < widget.selectedMedicines.length; j++) {
        if (treatmentFeedback[i]["antibiotico"] ==
            widget.selectedMedicines[j]["antibiotico"]) {
          feedbackToUser.add(treatmentFeedback[i]);
        }
      }
    }
    firstTreatmentFeedback = List.from(feedbackToUser);
  }

  //Metodo para restar el consumo de los medicamentos utilizados en la mochila.
  void setBackpackDosesFirstTreatment() {
    for (int i = 0; i < feedbackToUser.length; i++) {
      for (int j = 0; j < mochilaSeleccionada.length; j++) {
        if (mochilaSeleccionada[j]["antibiotico"] ==
            feedbackToUser[i]["antibiotico"]) {
          int setDosis = int.parse(mochilaSeleccionada[j]["dias"]) -
              int.parse(feedbackToUser[i]["dias"]);
          mochilaSeleccionada[j]["dias"] = setDosis.toString();
        }
      }
    }
  }

  void setNewLifeFirstTreatment() {
    double vidaFirst = 0.0;
    for (int i = 0; i < feedbackToUser.length; i++) {
      vidaFirst = vidaFirst + (int.parse(feedbackToUser[i]["vida"]) / 100);
    }
    if (vidaFirst > 0.2) {
      vidaFirst = 0.2;
    }

    int precision = 10;
    int diff =
        (vidaJugador * precision).round() - (vidaFirst * precision).round();
    vidaJugador = diff / precision;
    //print(vidaJugador);
    vidaPerdida = (vidaFirst * 100.0).toInt();
    lifeLost = vidaPerdida;
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
