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
  }

  int contadorDias = 0;
  List listaFinal = [];
  String question = "";
  List contadorItems = [];
  bool copiar = false;
  List mochilaDias = [];
  List<int> pastillasDias = [];
  int checkpills = 0;

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
    fillAllLists();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, //set your height
        flexibleSpace: SafeArea(
          child: Column(
            children: [
              const Text(
                "Segundo Tratamiento",
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
                  IconButton(
                      icon: const Icon(Icons.two_k_outlined),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const TreatmentFeedbackPop();
                          },
                        );
                      }),
                  IconButton(
                      icon: const Icon(Icons.whatsapp), onPressed: () {}),
                  IconButton(
                      icon: const Icon(Icons.facebook_outlined),
                      onPressed: () {}),
                ],
              ),
              // set your search bar setting
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Life(),
            const Timer(),
            SecondTreatmentQuestionHtml(questionHtml: question),
            SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: mochilaSeleccionada.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(mochilaSeleccionada[index]["antibiotico"] +
                            " - " +
                            mochilaSeleccionada[index]["via"] +
                            " - " +
                            mochilaSeleccionada[index]["dosis"] +
                            " cada " +
                            mochilaSeleccionada[index]["intervalo"] +
                            " horas"),
                        trailing: SizedBox(
                          height: 150,
                          width: 150,
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () => setState(() {
                                  copiar = true;
                                  if (contadorItems[index] > 0) {
                                    contadorItems[index]--;
                                  }
                                }),
                              ),
                              Text(contadorItems[index].toString()),
                              IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () => setState(() {
                                        copiar = true;
                                        if (contadorItems[index] !=
                                            mochilaDias[index]) {
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
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      copiar = true;

                      checkDaysCount();
                      checkPills();
                      //Sí has seleccionado algún día en los medicamentos entra aquí  en caso contrario te indica mediante una alerta que tienes que seleccionar al menos un medicamento.
                      if (checkpills == 0) {
                        showDialog<String>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) => AlertDialog(
                                  content: const Text(
                                      'Se han agotado todos los medicamentos, has perdido.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LooseScreen()),
                                      ),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ));
                      } else {
                        if (contadorDias == 1) {
                          for (var i = 0; i < mochilaSeleccionada.length; i++) {
                            int pastillasGastadas =
                                contadorItems[i] * pastillasDias[i];
                            int resta = int.parse(
                                    mochilaSeleccionada[i]["numerodosis"]) -
                                pastillasGastadas;
                            mochilaSeleccionada[i]["numerodosis"] =
                                resta.toString();
                            listaFinal[i]["dias"] = contadorItems[i];
                          }

                          for (int i = 0; i < listaFinal.length; i++) {
                            if (listaFinal[i]["dias"] == 0) {
                              listaFinal.remove(listaFinal[i]);
                            }
                          }
                          print(listaFinal);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TreatmentFeedback(
                                  selectedMedicines: listaFinal),
                            ),
                          );
                        } else {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    content: const Text(
                                        'Debes seleccionar al menos un medicamento.'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ));
                        }
                      }
                    },
                    child: const Text(
                      'Confirmar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void fillAllLists() {
    if (copiar == false) {
      listaFinal = List.from(mochilaSeleccionada);
      for (var i = 0; i < mochilaSeleccionada.length; i++) {
        int pastillaspordia =
            24 ~/ int.parse(mochilaSeleccionada[i]["intervalo"]);
        int numpastillas = int.parse(mochilaSeleccionada[i]["numerodosis"]);
        int dias = numpastillas ~/ pastillaspordia;
        mochilaDias.add(dias);
        pastillasDias.add(pastillaspordia);
        contadorItems.add(0);
      }
    }
  }

  //Comprueba si has seleccionado días en algún medicamento.
  void checkDaysCount() {
    for (int i = 0; i < contadorItems.length; i++) {
      if (contadorItems[i] != 0) {
        contadorDias = 1;
      }
    }
  }

  //compruba si quedan medicamentos para seguir jugando
  void checkPills() {
    for (int i = 0; i < mochilaDias.length; i++) {
      if (mochilaDias[i] != 0) {
        checkpills++;
      }
    }
  }
}
