import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/screens/diagnostic/diagnostic_feedback.dart';
import 'package:app_antibioticos/html/html.dart';

class DiagnosticScreen extends StatefulWidget {
  const DiagnosticScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => HomeDiagnostic();
}

class HomeDiagnostic extends State<DiagnosticScreen> {
  List listAnswer = [];
  String question = "";
  bool comprobar = false;
  Color verde = Colors.white;
  Color rojo = Colors.white;
  List valorSwitch = [];
  List comprobarRespuesta = [];
  List colorSolucion = [];
  int x = 0;
  bool notifyswitch = false;

  @override
  void initState() {
    super.initState();
    getDiagnosticAnswer();
    getDiagnosticQuestion();
  }

  List<String> medicineNames = [];

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
    fillInitialLists();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Column(
            children: const [
              Text(
                "Pregunta Diagnóstica",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Life(),
          const Timer(),
          DiagnosticQuestionHtml(questionHtml: question),
          ListView.builder(
            scrollDirection: Axis.vertical,
            //physics: const NeverScrollableScrollPhysics(),

            shrinkWrap: true,
            // ignore: unnecessary_null_comparison
            itemCount: listAnswer == null ? 0 : listAnswer.length,
            itemBuilder: (BuildContext context, int index) {
              return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.indigo,
                  tileColor: colorSolucion[index],
                  title: Text("${listAnswer[index]["respuesta"]}"),
                  value: valorSwitch[index],
                  onChanged: notifyswitch
                      ? null
                      : (value) => setState(() {
                            valorSwitch[index] = value;
                          }));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    checkAnswers();
                  });
                },
                child: const Text(
                  'Comprobar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  if (comprobar == true) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                      return const DiagnosticFeedback();
                    }), (Route<dynamic> route) => false);
                  }
                },
                child: const Text(
                  'Siguiente',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ]),
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
    comprobar = true;
    x = 1;
    notifyswitch = true;
    if (comprobar == true) {
      for (var i = 0; i < comprobarRespuesta.length; i++) {
        if (comprobarRespuesta[i] == 0) {
          colorSolucion[i] = Colors.green;
        }
        if (comprobarRespuesta[i] == 1) {
          colorSolucion[i] = Colors.green;
          points = points + 2;
        }
        if (comprobarRespuesta[i] == 2) {
          if (points > 0) {
            points = points - 1;
          }
          colorSolucion[i] = Colors.red;
        }
      }
    }
  }
}
