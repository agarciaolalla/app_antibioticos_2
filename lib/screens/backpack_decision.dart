import 'dart:developer';

import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';

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

  List contadorItems = [];
  bool _isDisable = false;

  List mochilaCompleta = [];
  List mochilaSeleccionada = [];

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

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < mochilaCompleta.length; i++) {
      mochilaSeleccionada
          .add({"nombre": mochilaCompleta[i]["nombre"], "numero": "0"});
      contadorItems.add(0);
    }

    log(mochilaSeleccionada[0]["numero"]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccion de medicamentos'),
      ),
      body: Column(
        children: [
          //ToDo: Implementacion de html via rest (widget para cada info)
          const InfoHtmlModel(),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: mochilaCompleta.length,
            itemBuilder: (context, index) {
              //return ListTileItem(
              //  title: mochilaCompleta[index]["nombre"],
              //  cantidadMaxima: mochilaCompleta[index]["numero"],
              //);
              return ListTile(
                title: Text(mochilaCompleta[index]["nombre"]),
                trailing: SizedBox(
                  height: 150,
                  width: 150,
                  child: Row(
                    children: <Widget>[
                      contadorItems[index] != 0
                          ? IconButton(
                              icon: const Icon(Icons.remove),
                              //onPressed: () => setState(() => _itemCount--),
                              onPressed: () {
                                if (!_isDisable) {
                                  setState(() {
                                    contadorItems[index]--;
                                  });
                                }
                              },
                            )
                          : Container(),
                      Text(contadorItems[index].toString()),
                      IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => setState(() {
                                if (!_isDisable &&
                                    contadorItems[index] !=
                                        int.parse(
                                            mochilaCompleta[index]["numero"])) {
                                  contadorItems[index]++;
                                }
                              })),
                      IconButton(
                          icon: const Icon(Icons.check_circle),
                          onPressed: () {
                            //if (!_isDisable) {
                            //  _isDisable = true;
                            //} else {
                            //  _isDisable = false;
                            //}
                          })
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
              log("hola" + mochilaSeleccionada.length.toString());
              for (var i = 0; i < mochilaSeleccionada.length; i++) {
                mochilaSeleccionada[i]["numero"] = contadorItems[i].toString();
                log(mochilaSeleccionada[i]["nombre"]);
                log(mochilaSeleccionada[i]["numero"]);
              }
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

  void fillBackpack(String nombre, String numero) {
    mochilaSeleccionada.add({"nombre": nombre, "numero": numero});
  }
}
