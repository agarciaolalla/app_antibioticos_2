import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:app_antibioticos/models/models.dart';
import 'package:app_antibioticos/services/services.dart';

class FirstQuestion extends StatefulWidget {
  const FirstQuestion({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => HomeFirstQuestion();
}

class HomeFirstQuestion extends State<FirstQuestion> {
  List<bool> valores = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ranking"),
      ),
      body: getClients(context, listFirstAnswer()),
    );
  }

  Widget getClients(
      BuildContext context, Future<List<Firstanswer>> futureClient) {
    return FutureBuilder(
      future: futureClient,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el cargando...
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());

          case ConnectionState.done:
            if (snapshot.hasError) {
              return Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            }
            // print(snapshot.data);
            return snapshot.data != null
                ? clientList(snapshot.data)
                : Container(
                    alignment: Alignment.center,
                    child: const Center(
                      child: Text('Sin Datos'),
                    ),
                  );
          default:
            return const Text('Recarga la pantalla....!');
        }
      },
    );
  }

  Widget clientList(List<Firstanswer> lista) {
    for (var i = 0; i < lista.length; i++) {
      valores.add(false);
    }
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return SwitchListTile.adaptive(
            activeColor: Colors.indigo,
            title: Text(lista[index].respuesta),
            value: valores[index],
            onChanged: (value) => setState(() {
                  valores[index] = value;
                }));
      },
    );
  }
}
