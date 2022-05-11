import 'package:app_antibioticos/models/thirdquestion_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/html/html.dart';
import 'package:app_antibioticos/screens/screens.dart';

class BackpackDecisionScreen extends StatefulWidget {
  const BackpackDecisionScreen({Key? key}) : super(key: key);

  static List mochilaSeleccionada = [];
  @override
  State<BackpackDecisionScreen> createState() => _BackpackDecisionScreenState();
}

class _BackpackDecisionScreenState extends State<BackpackDecisionScreen> {
  @override
  void initState() {
    super.initState();
    getBackpack();
  }

  Future getBackpack() async {
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/backpack"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      mochilaCompleta = data['backpack'];
    });
  }

  bool copiar = false;
  List contadorItems = [];
  List mochilaCompleta = [];
  //static List mochilaSeleccionada = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccion de medicamentos'),
      ),
      body: backpackSelection(),
    );
  }

  Widget backpackSelection() {
    if (copiar == false) {
      for (var i = 0; i < mochilaCompleta.length; i++) {
        BackpackDecisionScreen.mochilaSeleccionada
            .add({"nombre": mochilaCompleta[i]["nombre"], "numero": "0"});
        contadorItems.add(0);
      }
    }
    return Column(
      children: [
        const BackpackDecisionHtml(),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: mochilaCompleta.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                  BackpackDecisionScreen.mochilaSeleccionada[index]["nombre"]),
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
                                  int.parse(mochilaCompleta[index]["numero"])) {
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
            for (var i = 0;
                i < BackpackDecisionScreen.mochilaSeleccionada.length;
                i++) {
              BackpackDecisionScreen.mochilaSeleccionada[i]["numero"] =
                  contadorItems[i].toString();
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ThirdQuestionScreen()));
          },
          child: const Text(
            'Confirmar',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
