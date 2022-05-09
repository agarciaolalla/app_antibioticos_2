import 'dart:developer';

import 'package:app_antibioticos/models/models.dart';
import 'package:app_antibioticos/services/services.dart';
import 'package:app_antibioticos/screens/screens.dart';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterContact();
}

class _RegisterContact extends State<Login> {
  late TextEditingController controllerName;
  late TextEditingController controllerSurname;
  late TextEditingController controllerPhone;

  @override
  void initState() {
    controllerName = TextEditingController();
    controllerSurname = TextEditingController();
    controllerPhone = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Registrar Jugador"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 300, right: 300, top: 50),
          child: Column(
            children: [
              TextField(
                controller: controllerName,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: controllerSurname,
                decoration: const InputDecoration(labelText: 'Apellido'),
              ),
              ElevatedButton(
                  onPressed: () {
                    log(controllerName.text);
                    log(controllerSurname.text);
                    String name = controllerName.text;
                    String surname = controllerSurname.text;

                    if (name.isNotEmpty && surname.isNotEmpty) {
                      Player c =
                          Player(name: name, surname: surname, points: "");

                      addPlayer(c).then((client) {
                        log('Jugador registrado...!');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirstFeedbackScreen()),
                        );
                        // Navigator.pop(context, client);
                      });
                    }
                  },
                  child: const Text("Iniciar Juego")),
            ],
          ),
        ));
  }
}
