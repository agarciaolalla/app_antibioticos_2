import 'package:app_antibioticos/screens/final_screen.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

class TreatmentScreen extends StatefulWidget {
  const TreatmentScreen({Key? key}) : super(key: key);

  @override
  State<TreatmentScreen> createState() => TreatmentState();
}

class TreatmentState extends State<TreatmentScreen> {
  @override
  void initState() {
    super.initState();
    getTreatmentQuestion();
    // getTreatmentAnswer();
  }

  List listAnswer = [];
  String question = "";
  List contadorItems = [];
  bool copiar = false;

  Future getTreatmentQuestion() async {
    List returnList = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/treatment_question"));
    // debugPrint(response.body);
    data = json.decode(response.body);
    setState(() {
      returnList = data['treatment_question'];
      for (int i = 0; i < returnList.length; i++) {
        if (returnList[i]["idcaso"] == idcaso.toString()) {
          question = returnList[i]["pregunta"];
        }
        print(question);
      }
    });
  }

  //Future getTreatmentAnswer() async {
  //  List returnlista = [];
//
  //  Map data;
  //  http.Response response =
  //      await http.get(Uri.parse(conexion1 + "/api/treatment_feedback"));
  //  // debugPrint(response.body);
  //  data = json.decode(response.body);
//
  //  setState(() {
  //    returnlista = data['treatment_feedback'];
//
  //    for (var i = 0; i < returnlista.length; i++) {
  //      if (returnlista[i]["idcaso"] == idcaso.toString()) {
  //        listAnswer.add(returnlista[i]);
  //      }
  //    }
  //  });
  //}

  @override
  Widget build(BuildContext context) {
    if (copiar == false) {
      for (var i = 0; i < mochilaSeleccionada.length; i++) {
        contadorItems.add(0);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda pregunta"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Life(),
            Timer(),
            //Text(question),
            SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: mochilaSeleccionada.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(mochilaSeleccionada[index]["antibiotico"]),
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
                                            int.parse(mochilaSeleccionada[index]
                                                ["numpastillas"])) {
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
                        int numero = contadorItems[i];
                        int resta =
                            int.parse(mochilaSeleccionada[i]["numpastillas"]) -
                                numero;
                        mochilaSeleccionada[i]["numpastillas"] =
                            resta.toString();
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FinalScreen()));
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
