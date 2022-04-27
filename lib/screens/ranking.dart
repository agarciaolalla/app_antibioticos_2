import 'package:flutter/material.dart';

import 'package:app_antibioticos/models/models.dart';
import 'package:app_antibioticos/services/services.dart';

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
      body: getClients(context, listClient()),
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
    return ListView.builder(
      itemCount: jugadores.length,
      itemBuilder: (context, index) {
        jugadores.sort((a, b) {
          return int.parse(b.points).compareTo(int.parse(a.points));
          //softing on numerical order (Descending order by Roll No integer)
        });
        return ListTile(
          title: Text(jugadores[index].name + " " + jugadores[index].surname),
          subtitle: Text(jugadores[index].points),
          leading: CircleAvatar(
            child: Text((index + 1).toString()),
          ),
        );
      },
    );
  }
}
