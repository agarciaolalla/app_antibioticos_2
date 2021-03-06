import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/screens/screens.dart';

class TreatmentFeedback extends StatefulWidget {
  const TreatmentFeedback({Key? key, required this.listaFinal})
      : super(key: key);

  final List listaFinal;

  @override
  State<TreatmentFeedback> createState() => _TreatmentFeedbackState();
}

class _TreatmentFeedbackState extends State<TreatmentFeedback> {
  List treatmentFeedback = [];
  List feedbackToUser = [];

  int vidaPerdida = 0;

  String mostrarVidaPerdida = "";
  String feedback = "";
  String muerte = "Has perdido...El paciente ha muerto.";

  List<int> checkDays = [];
  List daysFeedback = [];
  List cardList = [];
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
      feedback = treatmentFeedback[0]["lastfeedback"];
    });
  }

  @override
  Widget build(BuildContext context) {
    initialFill();
    setNewLifeSecondTreatment();
    fillCardList();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Column(
            children: [
              const Text(
                "Feedback Tratamiento Dirigido",
                style: TextStyle(
                    fontSize: 25, fontFamily: 'FjallaOne', color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset("assets/backpack.png"),
                    tooltip: "Mochila",
                    iconSize: 50,
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
                    icon: Image.asset("assets/initialInfoIcon.png"),
                    tooltip: "Informaci??n inicial",
                    iconSize: 50,
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
                    icon: Image.asset("assets/diagnosticFeedbackIcon.png"),
                    tooltip: "Feedback Pregunta Diagn??stico",
                    iconSize: 50,
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
                    icon: Image.asset("assets/treatmentFeedbackIcon.png"),
                    tooltip: "Feedback Pregunta Tratamiento Emp??rico",
                    iconSize: 50,
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
            const Point(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                feedback,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            SecondCardViewTreatmentFeedback(treatmentFeedback: cardList),
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
    for (int i = 0; i < treatmentFeedback.length; i++) {
      for (int j = 0; j < widget.listaFinal.length; j++) {
        if (treatmentFeedback[i]["antibiotico"] ==
            widget.listaFinal[j]["antibiotico"]) {
          feedbackToUser.add(treatmentFeedback[i]);
          checkDays.add(int.parse(widget.listaFinal[j]["dias"]));
          cardList.add(treatmentFeedback[i]);
        }
      }
    }
  }

  void fillCardList() {
    for (int i = 0; i < checkDays.length; i++) {
      cardList[i]["dias"] = checkDays[i].toString();
    }
  }

  void setNewLifeSecondTreatment() {
    double vidaSecond = 0.0;
    //print(checkDays);
    //print(feedbackToUser);
    for (int i = 0; i < feedbackToUser.length; i++) {
      if (feedbackToUser[i]["favorable"] == 'si') {
        if (int.parse(feedbackToUser[i]["dias"]) > checkDays[i]) {
          vidaSecond = vidaSecond + 0.1;
        }
      } else if (feedbackToUser[i]["activo"] == 'No') {
        vidaSecond = vidaSecond + 0.2;
      } else {
        if (feedbackToUser[i]["via"] == 'V??a Oral') {
          if (int.parse(feedbackToUser[i]["dias"]) >= checkDays[i]) {
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

    int precision = 10;

    int suma =
        (vidaSecond * precision).round() + (vidaCaso * precision).round();
    vidaSecond = suma / precision;
    if (vidaSecond > 0.2) {
      vidaSecond = 0.2;
    }
    int resta =
        (vidaSecond * precision).round() - (vidaCaso * precision).round();
    vidaSecond = resta / precision;
    int diff =
        (vidaJugador * precision).round() - (vidaSecond * precision).round();
    vidaJugador = diff / precision;
    vidaPerdida = (vidaSecond * 100).toInt();
    ajustarVidaPerdida();
  }

  void ajustarVidaPerdida() {
    if (vidaPerdida == 0) {
      mostrarVidaPerdida = "El paciente no ha perdido vida.";
    } else {
      mostrarVidaPerdida =
          "El paciente ha perdido un " + vidaPerdida.toString() + "% de vida";
    }
  }
}
