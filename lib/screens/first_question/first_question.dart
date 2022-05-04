import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//import 'package:app_antibioticos/models/models.dart';
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

  String idcaso = "0";
  List listAnswer = [];
  String question = "";
  List valorSwitch = [];

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
    for (var i = 0; i < listAnswer.length; i++) {
      valorSwitch.add(false);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(question),
        backgroundColor: Colors.indigo[900],
      ),
      body: ListView.builder(
        itemCount: listAnswer == null ? 0 : listAnswer.length,
        itemBuilder: (BuildContext context, int index) {
          return SwitchListTile.adaptive(
              activeColor: Colors.indigo,
              title: Text(
                  "${listAnswer[index]["respuesta"]} ${listAnswer[index]["solucion"]}"),
              value: valorSwitch[index],
              onChanged: (value) => setState(() {
                    valorSwitch[index] = value;
                  }));
        },
      ),
    );
  }
}
