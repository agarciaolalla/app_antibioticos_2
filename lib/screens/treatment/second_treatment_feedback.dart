import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/screens/screens.dart';

class TreatmentFeedback extends StatefulWidget {
  const TreatmentFeedback(
      {Key? key, required this.selectedMedicines, required this.contadorDias})
      : super(key: key);

  final List selectedMedicines;
  final List contadorDias;
  @override
  State<TreatmentFeedback> createState() => _TreatmentFeedbackState();
}

class _TreatmentFeedbackState extends State<TreatmentFeedback> {
  List treatmentFeedback = [];
  List feedbackToUser = [];
  int vidaPerdida = 0;
  String mostrarVidaPerdida = "";
  List<int> checkDays = [];
  List daysFeedback = [];
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
        await http.get(Uri.parse(conexion1 + "/api/second_treatment_feedback"));
    data = json.decode(response.body);

    setState(() {
      returnlista = data['second_treatment_feedback'];

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
    setNewLifeSecondTreatment();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: SafeArea(
          child: Column(
            children: [
              const Text(
                "Tratamiento Empírico",
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
                  IconButton(
                    icon: const Icon(Icons.comment_bank_outlined),
                    tooltip: "Feedback Pregunta Tratamiento Empírico",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const TreatmentFeedbackDialog();
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
            SecondCardViewTreatmentFeedback(
                treatmentFeedback: feedbackToUser, daysFeedback: daysFeedback),
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
                if (vidaJugador <= 0.0) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return LooseScreen(informacion: muerte);
                  }), (Route<dynamic> route) => false);
                } else {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return const FinalScreen();
                  }), (Route<dynamic> route) => false);
                }
              },
              child: const Text(
                'Continuar',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //InitialFill
  void initialFill() {
    daysFeedback = List.from(mochilaSeleccionada);

    for (int i = 0; i < daysFeedback.length; i++) {
      daysFeedback[i]["dias"] = widget.contadorDias[i].toString();
    }
    for (int i = 0; i < treatmentFeedback.length; i++) {
      for (int j = 0; j < widget.selectedMedicines.length; j++) {
        if (treatmentFeedback[i]["antibiotico"] ==
            widget.selectedMedicines[j]["antibiotico"]) {
          feedbackToUser.add(treatmentFeedback[i]);
          checkDays.add(int.parse(widget.selectedMedicines[j]["dias"]));
        }
      }
    }
    secondTreatmentFeedback = List.from(feedbackToUser);
  }

  void setNewLifeSecondTreatment() {
    double vidaSecond = 0.0;
    for (int i = 0; i < feedbackToUser.length; i++) {
      if (feedbackToUser[i]["favorable"] == 'si' &&
          int.parse(feedbackToUser[i]["dias"]) < checkDays[i]) {
        vidaSecond = vidaSecond + 0.1;
      } else if (feedbackToUser[i]["activo"] == 'No') {
        vidaSecond = vidaSecond + 0.2;
      } else {
        if (feedbackToUser[i]["via"] == 'Vía Oral') {
          if (int.parse(feedbackToUser[i]["dias"]) < checkDays[i]) {
            //No le penaliza la vida en este caso.
          } else {
            vidaSecond = vidaSecond + 0.1;
          }
        } else {
          if (int.parse(feedbackToUser[i]["dias"]) < checkDays[i]) {
            vidaSecond = vidaSecond + 0.1;
          } else {
            vidaSecond = vidaSecond + 0.2;
          }
        }
      }
    }
    if (vidaSecond > 0.2) {
      vidaSecond = 0.2;
    }
    int precision = 10;
    int diff =
        (vidaJugador * precision).round() - (vidaSecond * precision).round();
    vidaJugador = diff / precision;
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
