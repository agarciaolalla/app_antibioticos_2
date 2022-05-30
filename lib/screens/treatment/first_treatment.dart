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
  }

  String question = "";

  List listaFinal = [];
  List contadorItems = [];
  List valorSwitch = [];
  List medicamentosSuficientes = [];
  List treatmentFeedback = [];

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
    for (var i = 0; i < mochilaSeleccionada.length; i++) {
      valorSwitch.add(false);
    }
    if (mochilaVacia()) {
      return Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            flexibleSpace: SafeArea(
              child: Column(
                children: [
                  const Text(
                    "Tratamiento Empirico",
                    style: TextStyle(fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: const Icon(Icons.backpack_outlined),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const BackpackDialog();
                              },
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: AlertDialog(
            content: const Text(
                'No tienes suficientes medicamentos en la mochila para afrontar el reto. \nHas perdido la partida.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LooseScreen(),
                    ),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ));
    } else {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          flexibleSpace: SafeArea(
            child: Column(
              children: [
                const Text(
                  "Tratamiento Empirico",
                  style: TextStyle(fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.backpack_outlined),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const BackpackDialog();
                            },
                          );
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Life(),
            const Timer(),
            FirstTreatmentQuestionHtml(questionHtml: question),
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
                } else if (!suficientesMedicamentos()) {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            content: const Text(
                                'No hay cantidad suficiente de uno de los medicamentos seleccionados. Compruebe su seleccion'),
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

  /*Metodo para comprobar si en la mochila hay suficientes medicamentos para cubir lo solicitado
  * True = Hay suficientes. False = No hay suficientes.
  */
  bool suficientesMedicamentos() {
    bool suficientes = true;

    for (int i = 0; i < mochilaSeleccionada.length; i++) {
      for (int j = 0; j < treatmentFeedback.length; j++) {
        if (mochilaSeleccionada[i]["antibiotico"] ==
                treatmentFeedback[j]["antibiotico"] &&
            int.parse(mochilaSeleccionada[i]["dias"]) <
                int.parse(treatmentFeedback[j]["dias"])) {
          suficientes = false;
        }
      }
    }
    return suficientes;
  }

  /*Metodo para comprobar si hay medicamentos suficientes de al menos uno de ellos para poder continuar o game over
  * True = insuficientes & game over. False = Suficientes & continua el juego
  */
  bool mochilaVacia() {
    bool vacia = true;
    //false = insuficiente, true = suficiente
    List<bool> comprobacion = [];

    for (int i = 0; i < mochilaSeleccionada.length; i++) {
      for (int j = 0; j < treatmentFeedback.length; j++) {
        if (mochilaSeleccionada[i]["antibiotico"] ==
            treatmentFeedback[j]["antibiotico"]) {
          if (int.parse(mochilaSeleccionada[i]["dias"]) <
              int.parse(treatmentFeedback[j]["dias"])) {
            comprobacion.add(false);
          } else {
            comprobacion.add(true);
          }
        }
      }
    }
    //Si hay un caso en el que es true si que hay suficientes por lo que no esta vacia la mochila.
    for (int i = 0; i < comprobacion.length; i++) {
      if (comprobacion[i]) {
        vacia = false;
      }
    }
    return vacia;
  }
}
