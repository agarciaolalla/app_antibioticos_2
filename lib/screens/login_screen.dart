import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/models/models.dart';
import 'package:app_antibioticos/services/player_peticion.dart';
import 'package:app_antibioticos/screens/screens.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterContact();
}

class _RegisterContact extends State<Login> {
  late TextEditingController controllerName;
  late TextEditingController controllerSurname;

  bool existeJugador = false;

  @override
  void initState() {
    controllerName = TextEditingController();
    controllerSurname = TextEditingController();
    super.initState();
  }

  Future comprobarPlayer(name, surname) async {
    List returnlista = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/player"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnlista = data['player'];
      for (var i = 0; i < returnlista.length; i++) {
        if (returnlista[i]["nombre"].toLowerCase() == name.toLowerCase() &&
            returnlista[i]["apellido"].toLowerCase() == surname.toLowerCase()) {
          existeJugador = true;
          player.name = returnlista[i]["nombre"];
          player.surname = returnlista[i]["apellido"];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'FjallaOne',
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const SizedBox(
                width: 700,
                height: 500,
                child: RiveAnimation.asset(
                  "animations/login.riv",
                ),
              ),
              TextField(
                controller: controllerName,
                decoration: const InputDecoration(labelText: 'Nombre'),
                style: const TextStyle(fontSize: 17, color: Colors.black),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: controllerSurname,
                decoration: const InputDecoration(labelText: 'Apellido'),
                style: const TextStyle(fontSize: 17, color: Colors.black),
              ),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Si es la primera vez que accedes, introduce tu nombre y apellido y...",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      String name = controllerName.text;
                      String surname = controllerSurname.text;
                      if (name.isNotEmpty && surname.isNotEmpty) {
                        await comprobarPlayer(name, surname);
                        if (!existeJugador) {
                          Player p = Player(
                            name: name,
                            surname: surname,
                            points: "0",
                            challenges: "0",
                            medicines: "0",
                            life: "0.0",
                          );
                          addPlayer(p).then((player) {
                            player = p;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          });
                        } else {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: const Text(
                                'Jugador ya registrado',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      "Regístrate",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Si ya estas registrado",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      String name = controllerName.text;
                      String surname = controllerSurname.text;
                      if (name.isNotEmpty && surname.isNotEmpty) {
                        await comprobarPlayer(name, surname);
                        if (!existeJugador) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: const Text(
                                'No existe ningún jugador con ese nombre',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) {
                            return const HomeScreen();
                          }), (Route<dynamic> route) => false);
                        }
                      }
                    },
                    child: const Text(
                      "Inicia Sesion",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
