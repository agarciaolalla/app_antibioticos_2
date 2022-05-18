import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/html/html.dart';
import 'package:app_antibioticos/screens/screens.dart';

class BackpackDecisionScreen extends StatefulWidget {
  const BackpackDecisionScreen({Key? key}) : super(key: key);

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
    data = json.decode(response.body);

    setState(() {
      mochilaCompleta = data['backpack'];
    });
  }

  bool copiar = false;
  List contadorItems = [];
  List mochilaCompleta = [];

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
        mochilaSeleccionada
            .add({"nombre": mochilaCompleta[i]["nombre"], "numero": "0"});
        contadorItems.add(0);
      }
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: mochilaCompleta.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(mochilaSeleccionada[index]["nombre"]),
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
                                    int.parse(
                                        mochilaCompleta[index]["numero"])) {
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
                mochilaSeleccionada[i]["numero"] = contadorItems[i].toString();
              }
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InitialInfoScreen()));
            },
            child: const Text(
              'Confirmar',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
