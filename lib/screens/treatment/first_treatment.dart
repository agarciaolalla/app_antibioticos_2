import 'package:app_antibioticos/screens/final_screen.dart';
import 'package:app_antibioticos/screens/screens.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

class FirstTreatmentScreen extends StatefulWidget {
  const FirstTreatmentScreen({Key? key}) : super(key: key);

  @override
  State<FirstTreatmentScreen> createState() => FirstTreatmentState();
}

class FirstTreatmentState extends State<FirstTreatmentScreen> {
  @override
  void initState() {
    super.initState();
    getTreatmentQuestion();
  }

  int x = 0;
  List listaFinal = [];
  String question = "";
  List contadorItems = [];
  bool copiar = false;
  List valorSwitch = [];
  bool notifyswitch = false;

  //Método para obtener la pregunta del segundo Tratamiento
  Future getTreatmentQuestion() async {
    List returnList = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/treatment_question"));
    data = json.decode(response.body);
    setState(() {
      returnList = data['treatment_question'];
      for (int i = 0; i < returnList.length; i++) {
        if (returnList[i]["idcaso"] == idcaso.toString() &&
            returnList[i]["idpregunta"] == "1") {
          question = returnList[i]["pregunta"];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (x == 0) {
      for (var i = 0; i < mochilaSeleccionada.length; i++) {
        valorSwitch.add(false);
        listaFinal = List.from(mochilaSeleccionada);
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Primera Pregunta")),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const Life(),
        const Timer(),
        Text(question),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: mochilaSeleccionada.length,
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
                title: Text(mochilaSeleccionada[index]["antibiotico"]),
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
            for (var i = 0; i < mochilaSeleccionada.length; i++) {
              if (valorSwitch[i] == true) {
                listaFinal[i] = mochilaSeleccionada[i];
              }
            }

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DiagnosticFeedback()),
            );
          },
          child: const Text('Siguiente'),
        ),
      ]),
    );
  }
}
