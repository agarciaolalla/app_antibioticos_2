import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/html/html.dart';
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
    getTreatmentFeedback();
    fillBackpack();
  }

  String question = "";

  List listaFinal = [];
  List contadorItems = [];
  List valorSwitch = [];
  List medicamentosSuficientes = [];
  List treatmentFeedback = [];
  List backpack = [];

  bool copiar = false;
  bool notifyswitch = false;

  int contadorSwitch = 0;

  //Método para obtener la pregunta del primer Tratamiento
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
    return Scaffold(
      appBar: AppBar(
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
                  IconButton(
                    icon: Image.asset("assets/diagnosticFeedbackIcon.png"),
                    tooltip: "Feedback Pregunta Diagnóstico",
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
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Life(),
          const Point(),
          const Timer(),
          FirstTreatmentQuestionHtml(questionHtml: question),
          ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: backpack.length,
            itemBuilder: (BuildContext context, int index) {
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  backpack[index]["antibiotico"] +
                      " - " +
                      backpack[index]["dosis"] +
                      "/" +
                      backpack[index]["intervalo"] +
                      "h",
                  style: const TextStyle(fontSize: 17, color: Colors.black),
                ),
                value: valorSwitch[index],
                onChanged: notifyswitch
                    ? null
                    : (value) {
                        setState(
                          () {
                            valorSwitch[index] = value;
                          },
                        );
                      },
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              for (var i = 0; i < backpack.length; i++) {
                if (valorSwitch[i] == true) {
                  contadorSwitch = 1;
                }
              }
              if (contadorSwitch == 0) {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          content: const Text(
                            'Debes seleccionar al menos un medicamento.',
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ));
              } else if (!suficientesMedicamentos()) {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          content: const Text(
                            'No hay cantidad suficiente de uno de los medicamentos seleccionados. Compruebe su seleccion',
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                          ],
                        ));
              } else {
                for (var i = 0; i < backpack.length; i++) {
                  if (valorSwitch[i] == true) {
                    listaFinal.add(backpack[i]);
                  }
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return FirstTreatmentFeedback(selectedMedicines: listaFinal);
                }), (Route<dynamic> route) => false);
              }
            },
            child: const Text(
              'Siguiente',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ]),
      ),
    );
  }

  //rellenar array de mochila
  void fillBackpack() {
    for (int i = 0; i < mochilaSeleccionada.length; i++) {
      if (mochilaSeleccionada[i]["dias"] != "0") {
        backpack.add(mochilaSeleccionada[i]);
      }
    }
    for (var i = 0; i < backpack.length; i++) {
      valorSwitch.add(false);
    }
  }

  /*Metodo para comprobar si en la mochila hay suficientes medicamentos para cubir lo solicitado
  * True = Hay suficientes. False = No hay suficientes.
  */
  bool suficientesMedicamentos() {
    bool suficientes = true;

    for (int i = 0; i < backpack.length; i++) {
      for (int j = 0; j < treatmentFeedback.length; j++) {
        if (valorSwitch[i] == true) {
          if (backpack[i]["antibiotico"] ==
                  treatmentFeedback[j]["antibiotico"] &&
              int.parse(backpack[i]["dias"]) <
                  int.parse(treatmentFeedback[j]["dias"])) {
            suficientes = false;
          }
        }
      }
    }
    return suficientes;
  }
}
