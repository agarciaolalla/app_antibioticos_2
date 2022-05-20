import 'package:app_antibioticos/screens/final_screen.dart';
import 'package:app_antibioticos/screens/screens.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

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

  List listaFinal = [];
  String question = "";
  List contadorItems = [];
  bool copiar = false;
  List mochilaDias = [];
  List<int> pastillasDias = [];

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
    if (copiar == false) {
      listaFinal = List.from(mochilaSeleccionada);
      for (var i = 0; i < mochilaSeleccionada.length; i++) {
        int pastillaspordia =
            (24 / int.parse(mochilaSeleccionada[i]["intervalo"])) as int;
        int numpastillas = int.parse(mochilaSeleccionada[i]["numpastillas"]);
        int dias = (numpastillas / pastillaspordia) as int;
        print(dias);
        mochilaDias.add(dias);
        pastillasDias.add(pastillaspordia);
        contadorItems.add(0);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Segundo Tratamiento"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Life(),
            const Timer(),
            Text(question),
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
                      for (var i = 0; i < mochilaSeleccionada.length; i++) {
                        int pastillasGastadas =
                            contadorItems[i] * pastillasDias[i];
                        int resta =
                            int.parse(mochilaSeleccionada[i]["numpastillas"]) -
                                pastillasGastadas;
                        mochilaSeleccionada[i]["numpastillas"] =
                            resta.toString();
                        listaFinal[i]["dias"] = contadorItems[i];
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TreatmentFeedback(selectedMedicines: listaFinal),
                        ),
                      );
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
}
