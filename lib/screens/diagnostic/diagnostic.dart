import 'package:app_antibioticos/screens/screens.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/html/html.dart';

class DiagnosticScreen extends StatefulWidget {
  const DiagnosticScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => HomeDiagnostic();
}

class HomeDiagnostic extends State<DiagnosticScreen> {
  List listAnswer = [];
  String question = "";
  String buttonText = "Comprobar";
  Color verde = Colors.white;
  Color rojo = Colors.white;
  List valorSwitch = [];
  List comprobarRespuesta = [];
  List colorSolucion = [];
  int x = 0;
  bool rellenarCompletado = false;
  bool notifyswitch = false;
  bool comprobar = false;

  @override
  void initState() {
    super.initState();
    getDiagnosticAnswer();
    getDiagnosticQuestion();
  }

  List<String> medicineNames = [];
  List<String> feedback = [];

  //Te recoge la respuesta de la base de datos.
  Future getDiagnosticAnswer() async {
    List returnlista = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/diagnostic_answer"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnlista = data['diagnostic_answer'];

      for (var i = 0; i < returnlista.length; i++) {
        if (returnlista[i]["idcaso"] == idcaso.toString()) {
          listAnswer.add(returnlista[i]);
        }
      }
    });
  }

  //Te recoge la pregunta de la base de datos
  Future getDiagnosticQuestion() async {
    List returnlista = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/diagnostic_question"));
    data = json.decode(response.body);

    setState(() {
      returnlista = data['diagnostic_question'];

      for (var i = 0; i < returnlista.length; i++) {
        if (returnlista[i]["idcaso"] == idcaso.toString()) {
          question = returnlista[i]["pregunta"].toString();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!rellenarCompletado) {
      fillInitialLists();
    }
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Column(
            children: [
              const Text(
                "Pregunta Diagnóstica",
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
                  const SizedBox(width: 5),
                  IconButton(
                    icon: Image.asset("assets/initialInfoIcon.png"),
                    tooltip: "Información Inicial",
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
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Life(),
            const Point(),
            const Timer(),
            DiagnosticQuestionHtml(questionHtml: question),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listAnswer.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.cyan,
                        tileColor: colorSolucion[index],
                        title: Text(
                          "${listAnswer[index]["respuesta"]}",
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                        ),
                        value: valorSwitch[index],
                        onChanged: notifyswitch
                            ? null
                            : (value) => setState(() {
                                  valorSwitch[index] = value;
                                })),
                    Text(feedback[index]),
                  ],
                );
              },
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (!comprobar) {
                      setState(
                        () {
                          checkAnswers();
                          buttonText = "Continuar";
                        },
                      );
                    } else {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                        return const DiagnosticFeedback();
                      }), (Route<dynamic> route) => false);
                    }
                  },
                  child: Text(
                    buttonText,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  //Método que te inicializa las listas al iniciar la página
  fillInitialLists() {
    if (x == 0) {
      for (var i = 0; i < listAnswer.length; i++) {
        valorSwitch.add(false);
        comprobarRespuesta.add(0);
        colorSolucion.add(Colors.white);
        feedback.add("");
        rellenarCompletado = true;
      }
    }
  }

  //Método que te comprueba las respuestas cuando le das al botón comprobar, te cambia el color de las casillas y te añade los puntos del jugador
  checkAnswers() {
    for (var i = 0; i < listAnswer.length; i++) {
      if (valorSwitch[i] == true) {
        if (listAnswer[i]["solucion"] == "1") {
          comprobarRespuesta[i] = 1;
        } else {
          comprobarRespuesta[i] = 2;
        }
      } else {
        if (listAnswer[i]["solucion"] == "0") {
          comprobarRespuesta[i] = 0;
        } else {
          comprobarRespuesta[i] = 2;
        }
      }
    }

    //Si el checkbox está seleccionado y en la base de datos tiene que estarlo, se pone verde.
    comprobar = true;
    x = 1;
    notifyswitch = true;
    if (comprobar == true) {
      for (var i = 0; i < comprobarRespuesta.length; i++) {
        feedback[i] = listAnswer[i]["feedback"];
        if (comprobarRespuesta[i] == 0) {
          colorSolucion[i] = Colors.green;
        }
        if (comprobarRespuesta[i] == 1) {
          colorSolucion[i] = Colors.green;
          pointsPerCase = pointsPerCase + 2;
        }
        if (comprobarRespuesta[i] == 2) {
          if (pointsPerCase > 0) {
            pointsPerCase = pointsPerCase - 1;
          }
          colorSolucion[i] = Colors.red;
        }
      }
    }

    points = points + pointsPerCase;
    pointsBar = pointsBar + (pointsPerCase / 100);
  }
}
