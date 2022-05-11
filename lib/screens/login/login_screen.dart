import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/models/models.dart';
import 'package:app_antibioticos/services/services.dart';
import 'package:app_antibioticos/screens/screens.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterContact();
}

class _RegisterContact extends State<Login> {
  late TextEditingController controllerName;
  late TextEditingController controllerSurname;
  int existeJugador = 0;

  @override
  void initState() {
    controllerName = TextEditingController();
    controllerSurname = TextEditingController();
    super.initState();
  }

  Future comprobarPlayer(name, surname) async {
    List returnlista = [];
    Map data;
    existeJugador = 0;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/player"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnlista = data['player'];
      for (var i = 0; i < returnlista.length; i++) {
        if (returnlista[i]["nombre"].toLowerCase() == name.toLowerCase() &&
            returnlista[i]["apellido"].toLowerCase() == surname.toLowerCase()) {
          existeJugador = 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Registrar Jugador"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: controllerName,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: controllerSurname,
                decoration: const InputDecoration(labelText: 'Apellido'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () async {
                    String name = controllerName.text;
                    String surname = controllerSurname.text;
                    if (name.isNotEmpty && surname.isNotEmpty) {
                      await comprobarPlayer(name, surname);
                      if (existeJugador != 1) {
                        Player c =
                            Player(name: name, surname: surname, points: "0");

                        addPlayer(c).then((client) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FirstQuestion()),
                          );
                        });
                      } else {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  content: const Text('Jugador ya registrado'),
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
                  child: const Text("Registrar Jugador")),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () async {
                    String name = controllerName.text;
                    String surname = controllerSurname.text;
                    if (name.isNotEmpty && surname.isNotEmpty) {
                      await comprobarPlayer(name, surname);
                      if (existeJugador != 1) {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  content: const Text(
                                      'No existe ningún jugador con ese nombre'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ));
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirstQuestion()),
                        );
                      }
                    }
                  },
                  child: const Text("Iniciar Sesion")),
            ],
          ),
        ));
  }
}
