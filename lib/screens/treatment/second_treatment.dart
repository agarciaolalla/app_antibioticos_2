import 'package:app_antibioticos/html/html.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/screens/screens.dart';

class SecondTreatmentScreen extends StatefulWidget {
  const SecondTreatmentScreen({Key? key}) : super(key: key);

  @override
  State<SecondTreatmentScreen> createState() => SecondTreatmentState();
}

class SecondTreatmentState extends State<SecondTreatmentScreen> {
  @override
  void initState() {
    super.initState();
    getTreatmentQuestion();
    fillLists();
    checkPills();
  }

  List diasUtilizados = [
    {"antibiotico", "dias"}
  ];
  String asset = "Antibiograma" + idcaso.toString() + ".png";

  //List mostrarMochila =[]; //Mochila que muestra los antibioticos que SI tienen dosis restantes
  bool medicamentosRestantes =
      false; //Contador para saber si quedan medicamentos en la mochila
  bool contadorDias =
      false; //Indicador de si has seleccionado o no medicamento para en caso de que no lo hayas seleccionado te diga que tienes que seleccionar al menos uno
  List listaFinal = [];
  String question =
      ""; //Nombre de la pregunta que se rellena desde la base de datos.
  List contadorItems =
      []; //Lista con el contador de pastillas de cada medicamento
  bool recargarBody = false; //Booleano que te inidca si el body se ha recargado
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
            returnList[i]["idpregunta"] == "2") {
          question = returnList[i]["pregunta"];
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
                "Tratamiento Dirigido",
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
                    tooltip: "Información inicial",
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
                  IconButton(
                    icon: Image.asset("assets/treatmentFeedbackIcon.png"),
                    tooltip: "Feedback Pregunta Tratamiento Empírico",
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Life(),
            const Point(),
            const Timer(),
            Column(
              children: [
                SecondTreatmentQuestionHtml(questionHtml: question),
                Image(
                  image: AssetImage("assets/" + asset),
                ),
                //ShowAntibiogram(asset: asset)
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: RichText(
                        text: const TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  '¿Qué tratamiento antibiótico cree indicado?\n\nSeleccione los antibioticos que considere entre los disponibles en su mochila.\n\nPerdida maxima de vida del paciente: 20%',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                            ),
                            TextSpan(
                              text: '\n\nDías a seleccionar:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: mochilaSeleccionada.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          mochilaSeleccionada[index]["antibiotico"] +
                              " - " +
                              mochilaSeleccionada[index]["via"] +
                              " - " +
                              mochilaSeleccionada[index]["dosis"] +
                              " cada " +
                              mochilaSeleccionada[index]["intervalo"] +
                              " horas",
                          style: const TextStyle(
                              fontSize: 17, color: Colors.black),
                        ),
                        leading: SizedBox(
                          height: 150,
                          width: 150,
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () => setState(() {
                                  if (contadorItems[index] > 0) {
                                    contadorItems[index]--;
                                  }
                                }),
                              ),
                              Text(
                                contadorItems[index].toString(),
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                              IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () => setState(() {
                                        if (contadorItems[index] <
                                            int.parse(mochilaSeleccionada[index]
                                                ["dias"])) {
                                          contadorItems[index]++;
                                        }
                                      })),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //Sí has seleccionado algún día en los medicamentos entra aquí  en caso contrario te indica mediante una alerta que tienes que seleccionar al menos un medicamento.
                      if (checkDaysCount() == true) {
                        for (var i = 0; i < mochilaSeleccionada.length; i++) {
                          if (contadorItems[i] > 0) {
                            String antibiotico =
                                mochilaSeleccionada[i]["antibiotico"];

                            listaFinal.add({
                              "antibiotico": antibiotico,
                              "dias": contadorItems[i].toString()
                            });

                            if (mochilaSeleccionada[i]["dias"] ==
                                (contadorItems[i]).toString()) {
                              mochilaSeleccionada[i]["dias"] = "0";
                            } else {
                              mochilaSeleccionada[i]["dias"] =
                                  (int.parse(mochilaSeleccionada[i]["dias"]) -
                                          contadorItems[i])
                                      .toString();
                            }

                            //Si has seleccionado el medicamento se introduce en la lista que le vas a pasar al feedback
                          }
                        }
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                          return TreatmentFeedback(listaFinal: listaFinal);
                        }), (Route<dynamic> route) => false);
                      } else {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  content: const Text(
                                    'Debes seleccionar al menos un medicamento.',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ));
                      }
                    },
                    child: const Text(
                      'Confirmar',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  fillLists() {
    for (int i = 0; i < mochilaSeleccionada.length; i++) {
      contadorItems.add(0);
    }
  }

  //Comprueba si has seleccionado días en algún medicamento.
  bool checkDaysCount() {
    bool comprobarDias = false;
    for (int i = 0; i < contadorItems.length; i++) {
      if (contadorItems[i] > 0) {
        comprobarDias = true;
      }
    }
    return comprobarDias;
  }

  //compruba si quedan medicamentos para seguir jugando
  checkPills() {
    bool comprobar = false;
    for (int i = 0; i < mochilaSeleccionada.length; i++) {
      if (int.parse(mochilaSeleccionada[i]["dias"]) > 0) {
        comprobar = true;
      }
    }

    if (comprobar == false) {
      showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
          content: const Text(
            'Se han agotado todos los medicamentos, has perdido.',
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return const LooseScreen(
                    informacion: "Has agotado todos los medicamentos.");
              }), (Route<dynamic> route) => false),
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          ],
        ),
      );
    }
  }
}
