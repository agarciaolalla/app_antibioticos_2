import 'package:app_antibioticos/html/html.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/screens/screens.dart';

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

  List listaFinal = [];
  String question = "";
  List contadorItems = [];
  bool copiar = false;
  List valorSwitch = [];
  bool notifyswitch = false;
  int contadorSwitch = 0;

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
    for (var i = 0; i < mochilaSeleccionada.length; i++) {
      valorSwitch.add(false);
    }
    print(mochilaSeleccionada);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Column(
            children: const [
              Text(
                "Primer Tratamiento",
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
            shrinkWrap: true,
            itemCount: mochilaSeleccionada.length,
            itemBuilder: (BuildContext context, int index) {
              return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
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
                  contadorSwitch = 1;
                }
              }
              if (contadorSwitch == 0) {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          content: const Text(
                              'Debes seleccionar al menos un medicamento.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ));
              } else {
                for (var i = 0; i < mochilaSeleccionada.length; i++) {
                  if (valorSwitch[i] == true) {
                    listaFinal.add(mochilaSeleccionada[i]);
                  }
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TreatmentFeedback(selectedMedicines: listaFinal),
                  ),
                );
              }
            },
            child: const Text('Siguiente'),
          ),
        ]),
      ),
    );
  }
}
