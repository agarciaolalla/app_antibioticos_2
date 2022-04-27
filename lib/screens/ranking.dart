import 'package:app_antibioticos/models/models.dart';
import 'package:app_antibioticos/models/player_model.dart';
import 'package:app_antibioticos/request/firstanswer_peticion.dart';
import 'package:app_antibioticos/request/player_peticion.dart';
import 'package:app_antibioticos/request/thirdquestion_peticion.dart';
import 'package:flutter/material.dart';

import '../request/thirdquestion_peticion.dart';

class Ranking extends StatefulWidget {
  const Ranking({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => HomeRanking();
}

class HomeRanking extends State<Ranking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ranking"),
      ),
      body: getClients(context, listThirdQuestion()),
    );
  }

  Widget getClients(
      BuildContext context, Future<List<Thirdquestion>> futureClient) {
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

  Widget clientList(List<Thirdquestion> jugadores) {
    return ListView.builder(
      itemCount: jugadores.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(jugadores[index].idCaso),
          subtitle: Text(jugadores[index].pregunta),
          leading: CircleAvatar(
            child: Text((index + 1).toString()),
          ),
        );
      },
    );
  }
}
