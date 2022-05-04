import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//import 'package:app_antibioticos/models/models.dart';
import 'package:app_antibioticos/screens/screens.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

class FirstQuestion extends StatefulWidget {
  const FirstQuestion({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => HomeFirstQuestion();
}

class HomeFirstQuestion extends State<FirstQuestion> {
  @override
  void initState() {
    super.initState();
    getFirstAnswer();
    getFirstQuestion();
  }

  String idcaso = "1";
  List listAnswer = [];
  String question = "";
  bool comprobar = false;
  Color verde = Colors.white;
  Color rojo = Colors.white;
  List valorSwitch = [];
  List comprobarRespuesta = [];
  int x = 0;
  bool notifyswitch = false;

  Future getFirstAnswer() async {
    List returnlista = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/firstanswer"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnlista = data['firstanswer'];

      for (var i = 0; i < returnlista.length; i++) {
        if (returnlista[i]["idcaso"] == idcaso) {
          listAnswer.add(returnlista[i]);
        }
      }
    });
  }

  Future getFirstQuestion() async {
    List returnlista = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/firstquestion"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnlista = data['firstquestion'];

      for (var i = 0; i < returnlista.length; i++) {
        if (returnlista[i]["idcaso"] == idcaso) {
          question = returnlista[i]["pregunta"];
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
      appBar: AppBar(
        title: const Text("Primera Pregunta"),
        backgroundColor: Colors.indigo[900],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(question),
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
                MaterialPageRoute(builder: (context) => Ranking()),
              );
            }
          },
          child: const Text('Siguiente'),
        ),
      ]),
    );
  }
}
