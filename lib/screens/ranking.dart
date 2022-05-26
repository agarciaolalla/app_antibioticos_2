import 'package:flutter/material.dart';

import 'package:app_antibioticos/models/models.dart';
import 'package:app_antibioticos/services/player_peticion.dart';

class Ranking extends StatefulWidget {
  const Ranking({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => HomeRanking();
}

List<Player> playersRank = [];

class HomeRanking extends State<Ranking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Column(
            children: const [
              Text(
                "Ranking Jugadores",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
      body: getClients(context, listPlayer()),
    );
  }

  Widget getClients(BuildContext context, Future<List<Player>> futureClient) {
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

  Widget clientList(List<Player> jugadores) {
    orderPlayers(jugadores);
    return ListView.builder(
      itemCount: playersRank.length,
      itemBuilder: (context, index) {
        return ListTile(
          title:
              Text(playersRank[index].name + " " + playersRank[index].surname),
          subtitle: Text("Vida: " +
              playersRank[index].life +
              "%" +
              "\nAntibioticos Restantes: " +
              playersRank[index].medicines +
              "\nPuntuacion Diagnostica: " +
              playersRank[index].points +
              " puntos"),
          leading: CircleAvatar(
            child: Text((index + 1).toString()),
          ),
        );
      },
    );
  }

  //Metodo para ordenar a los jugadores en el ranking
  void orderPlayers(List<Player> jugadores) {
    //Añadimos solamente los jugadores que hayan completado los 5 casos
    for (int i = 0; i < jugadores.length; i++) {
      if (jugadores[i].challenges == "5") {
        playersRank.add(jugadores[i]);
      }
    }
    //Ordenamos los jugadores que hayan completado los 5 casos
    for (int i = 1; i < playersRank.length; i++) {
      double vida0 = double.parse(playersRank[i - 1].life);
      double vida1 = double.parse(playersRank[i].life);
      if (vida1 > vida0) {
        Player copia = playersRank[i - 1];
        playersRank[i - 1] = playersRank[i];
        playersRank[i] = copia;
      } else if (vida1 == vida0) {
        int antibioticos0 = int.parse(playersRank[i - 1].medicines);
        int antibioticos1 = int.parse(playersRank[i].medicines);
        if (antibioticos1 > antibioticos0) {
          Player copia = playersRank[i - 1];
          playersRank[i - 1] = playersRank[i];
          playersRank[i] = copia;
        } else if (antibioticos0 == antibioticos1) {
          int puntos0 = int.parse(playersRank[i - 1].points);
          int puntos1 = int.parse(playersRank[i].points);
          if (puntos1 > puntos0) {
            Player copia = playersRank[i - 1];
            playersRank[i - 1] = playersRank[i];
            playersRank[i] = copia;
          }
        }
      }
    }
  }
}
