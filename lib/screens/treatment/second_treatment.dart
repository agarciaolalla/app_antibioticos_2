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
  bool copiar =
      false; //Boleano que copia el array al iniciar la screen, si se recarga no.
  List mochilaDias =
      []; //Lista que te dice los días seleccionables que hay de cada medicamento
  List<int> pastillasDias =
      []; //Lista que te dice las pastillas por cada día de cada medicamento
  int checkpills =
      0; //Indicador que te dice si quedan medicamentos en la mochila para seguir jugando

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
    checkPills();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
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
                                  if (contadorItems[index] > 0) {
                                    contadorItems[index]--;
                                  }
                                }),
                              ),
                              Text(contadorItems[index].toString()),
                              IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () => setState(() {
                                        if (contadorItems[index] !=
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
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      checkDaysCount();
                      //Sí has seleccionado algún día en los medicamentos entra aquí  en caso contrario te indica mediante una alerta que tienes que seleccionar al menos un medicamento.
                      if (contadorDias == true) {
                        print(contadorItems.length);
                        print(mochilaSeleccionada.length);
                        print(mochilaDias.length);
                        for (var i = 0; i < mochilaSeleccionada.length; i++) {
                          if (contadorItems[i] != 0) {
                            if (contadorItems[i] ==
                                int.parse(mochilaSeleccionada[i]["dias"])) {
                              mochilaSeleccionada
                                  .remove(mochilaSeleccionada[i]);
                              contadorItems.remove(contadorItems[i]);
                              mochilaDias.remove(mochilaDias[i]);
                            } else {
                              int pastillasGastadas =
                                  contadorItems[i] * pastillasDias[i];
                              int resta = int.parse(
                                      mochilaSeleccionada[i]["numerodosis"]) -
                                  pastillasGastadas;
                              mochilaSeleccionada[i]["numerodosis"] =
                                  resta.toString();
                              listaFinal.add(mochilaSeleccionada[i]);
                              listaFinal[i]["dias"] = contadorItems[i];
                            }
                            //Si has seleccionado el medicamento se introduce en la lista que le vas a pasar al feedback
                          }
                        }

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

  //Te rellena el array a mostrar dependiendo de si existen medicamentos en la mochila y en caso de no existir elimina dicho medicamento.
  void fillAllLists() {
    if (copiar == false) {
      for (var i = 0; i < mochilaSeleccionada.length; i++) {
        if (mochilaSeleccionada[i]["numerodosis"] != "0") {
          int pastillaspordia =
              24 ~/ int.parse(mochilaSeleccionada[i]["intervalo"]);
          int numpastillas = int.parse(mochilaSeleccionada[i]["numerodosis"]);
          int dias = numpastillas ~/ pastillaspordia;
          medicamentosRestantes = true;
          contadorItems.add(0);
          mochilaDias.add(dias);
          pastillasDias.add(pastillaspordia);
        } else {
          mochilaSeleccionada.remove(mochilaSeleccionada[i]);
        }
      }
    }
    copiar = true;
  }

  //Comprueba si has seleccionado días en algún medicamento.
  void checkDaysCount() {
    for (int i = 0; i < contadorItems.length; i++) {
      if (contadorItems[i] != 0) {
        contadorDias = true;
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
                          builder: (context) => const LooseScreen()),
                    ),
                    child: const Text('OK'),
                  ),
                ],
              ));
    }
  }
}
