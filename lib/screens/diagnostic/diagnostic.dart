import 'package:app_antibioticos/html/first_question_html.dart';
import 'package:app_antibioticos/screens/diagnostic/diagnostic_feedback.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/widgets/widgets.dart';

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
  int x = 0;
  bool notifyswitch = false;

  @override
  void initState() {
    super.initState();
    getDiagnosticAnswer();
    getDiagnosticQuestion();
  }

  Future getDiagnosticAnswer() async {
    List returnlista = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/diagnosticanswer"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnlista = data['diagnosticanswer'];

      for (var i = 0; i < returnlista.length; i++) {
        if (returnlista[i]["idcaso"] == idcaso.toString()) {
          listAnswer.add(returnlista[i]);
        }
      }
    });
  }

  Future getDiagnosticQuestion() async {
    List returnlista = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/diagnosticanswer"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnlista = data['diagnosticanswer'];

      for (var i = 0; i < returnlista.length; i++) {
        if (returnlista[i]["idcaso"] == idcaso) {
          question = returnlista[i]["pregunta"].toString();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (x == 0) {
      for (var i = 0; i < listAnswer.length; i++) {
        valorSwitch.add(false);
        comprobarRespuesta.add(true);
      }
    }
    if (comprobar == true) {
      verde = Colors.green;
      rojo = Colors.red;
    } else {
      verde = Colors.white;
      rojo = Colors.white;
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Primera Pregunta")),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const Life(),
        const Timer(),
        FirstQuestionHtml(pregunta: question),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: listAnswer == null ? 0 : listAnswer.length,
          itemBuilder: (BuildContext context, int index) {
            return SwitchListTile.adaptive(
                activeColor: Colors.indigo,
                tileColor: comprobarRespuesta[index] != null &&
                        comprobarRespuesta[index] == false
                    ? verde
                    : rojo,
                title: Text(
                    "${listAnswer[index]["respuesta"]} ${listAnswer[index]["solucion"]}"),
                value: valorSwitch[index],
                onChanged: notifyswitch
                    ? null
                    : (value) => setState(() {
                          valorSwitch[index] = value;
                        }));
          },
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              for (var i = 0; i < listAnswer.length; i++) {
                if (valorSwitch[i] == true) {
                  if (listAnswer[i]["solucion"] == "1") {
                    comprobarRespuesta[i] = true;
                  } else {
                    comprobarRespuesta[i] = false;
                  }
                } else {
                  if (listAnswer[i]["solucion"] != "1") {
                    comprobarRespuesta[i] = true;
                  } else {
                    comprobarRespuesta[i] = false;
                  }
                }
              }
              comprobar = true;
              x = 1;
              notifyswitch = true;
            });
          },
          child: const Text('Comprobar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (comprobar == true) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DiagnosticFeedback()),
              );
            }
          },
          child: const Text('Siguiente'),
        ),
      ]),
    );
  }
}
