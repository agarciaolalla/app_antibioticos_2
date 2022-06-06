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
                style: TextStyle(
                    fontSize: 25, fontFamily: 'FjallaOne', color: Colors.black),
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
          title: Text(
            playersRank[index].name + " " + playersRank[index].surname,
            style: const TextStyle(color: Colors.black, fontSize: 17),
          ),
          subtitle: Text(
            "Retos completados: " +
                playersRank[index].challenges +
                "\nVida: " +
                playersRank[index].life +
                "%" +
                "\nAntibioticos Restantes: " +
                playersRank[index].medicines +
                "\nPuntuacion Diagnostica: " +
                playersRank[index].points +
                " puntos",
            style: const TextStyle(color: Colors.black, fontSize: 17),
          ),
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

    //Ordenamos los jugadores con 5 casos completados con los parametros solicitados.
    playersRank.sort((a, b) {
      int vida = double.parse(b.life).compareTo(double.parse(a.life));
      if (vida == 0) {
        int antibioticos =
            int.parse(b.medicines).compareTo(int.parse(a.medicines));
        if (antibioticos == 0) {
          return int.parse(b.points).compareTo(int.parse(a.medicines));
        }
        return antibioticos;
      }
      return vida;
    });

    //Creamos otro array donde meteremos los que tienen < 5 casos completados
    List<Player> playersFail = [];

    for (int i = 0; i < jugadores.length; i++) {
      if (int.parse(jugadores[i].challenges) < 5) {
        playersFail.add(jugadores[i]);
      }
    }

    //Ordenamos los jugadores con menos de 5 casos completados con los parametros solicitados
    playersFail.sort((a, b) {
      int retos = int.parse(b.challenges).compareTo(int.parse(a.challenges));
      if (retos == 0) {
        int puntos = int.parse(b.points).compareTo(int.parse(a.points));
        if (puntos == 0) {
          return int.parse(b.medicines).compareTo(int.parse(a.medicines));
        }
        return puntos;
      }
      return retos;
    });

    //Finalmente, añadimos los elementos ordenados al array que vamos a mostrar
    for (int i = 0; i < playersFail.length; i++) {
      playersRank.add(playersFail[i]);
    }
  }
}
