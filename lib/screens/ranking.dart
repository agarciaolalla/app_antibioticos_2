import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';

class Ranking extends StatefulWidget {
  const Ranking({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => HomeRanking();
}

class HomeRanking extends State<Ranking> {
  @override
  void initState() {
    super.initState();
    getPlayers();
  }

  List jugadores = [];
  List playersRank = [];

  //Te recoge la respuesta de la base de datos.
  Future getPlayers() async {
    List returnlista = [];

    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/player"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnlista = data['player'];

      for (var i = 0; i < returnlista.length; i++) {
        if (int.parse(returnlista[i]["retoscompletados"]) > 0) {
          jugadores.add(returnlista[i]);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    orderPlayers();
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: SafeArea(
            child: Column(
              children: const [
                Text(
                  "Ranking Jugadores",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'FjallaOne',
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: playersRank.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                playersRank[index]["nombre"] +
                    " " +
                    playersRank[index]["apellido"],
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
              subtitle: Text(
                "Retos completados: " +
                    playersRank[index]["retoscompletados"] +
                    "\nVida: " +
                    playersRank[index]["vida"] +
                    "%" +
                    "\nAntibioticos Restantes: " +
                    playersRank[index]["antibioticostotales"] +
                    "\nPuntuacion Diagnostica: " +
                    playersRank[index]["puntuacion"] +
                    " puntos",
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
              leading: CircleAvatar(
                child: Text((index + 1).toString()),
              ),
            );
          },
        ));
  }

  //Metodo para ordenar a los jugadores en el ranking
  void orderPlayers() {
    //Añadimos solamente los jugadores que hayan completado los 5 casos
    for (int i = 0; i < jugadores.length; i++) {
      if (jugadores[i]["retoscompletados"] == "5") {
        playersRank.add(jugadores[i]);
      }
    }

    //Ordenamos los jugadores con 5 casos completados con los parametros solicitados.
    playersRank.sort((a, b) {
      int vida = double.parse(b["vida"]).compareTo(double.parse(a["vida"]));
      if (vida == 0) {
        int antibioticos = int.parse(b["antibioticostotales"])
            .compareTo(int.parse(a["antibioticostotales"]));
        if (antibioticos == 0) {
          return int.parse(b.points)
              .compareTo(int.parse(a["antibioticostotales"]));
        }
        return antibioticos;
      }
      return vida;
    });

    //Creamos otro array donde meteremos los que tienen < 5 casos completados
    List playersFail = [];

    for (int i = 0; i < jugadores.length; i++) {
      if (int.parse(jugadores[i]["retoscompletados"]) < 5) {
        playersFail.add(jugadores[i]);
      }
    }

    //Ordenamos los jugadores con menos de 5 casos completados con los parametros solicitados
    playersFail.sort((a, b) {
      int retos = int.parse(b["retoscompletados"])
          .compareTo(int.parse(a["retoscompletados"]));
      if (retos == 0) {
        int puntos =
            int.parse(b["puntuacion"]).compareTo(int.parse(a["puntuacion"]));
        if (puntos == 0) {
          return int.parse(b["antibioticostotales"])
              .compareTo(int.parse(a["antibioticostotales"]));
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
