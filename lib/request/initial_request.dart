import 'package:app_antibioticos/services/backpack_peticion.dart';
import 'package:flutter/material.dart';

import 'package:app_antibioticos/models/models.dart';
import 'package:app_antibioticos/services/services.dart';

List<Backpack> mochila = [];
var caso = 1;

class BackPackRequest extends StatefulWidget {
  const BackPackRequest({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => RequestBackpack();
}

class RequestBackpack extends State<BackPackRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ranking"),
      ),
      body: getClients(context, listBackpack()),
    );
  }

  Widget getClients(BuildContext context, Future<List<Backpack>> futureClient) {
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

  Widget clientList(List<Backpack> lista) {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        if (int.parse(lista[index].idCaso) == caso) {
          mochila[index] = lista[index];
        }

        return ListTile(
          title: Text(lista[index].idCaso + lista[index].nombre),
          subtitle: Text(lista[index].dosis + lista[index].numero),
          leading: CircleAvatar(
            child: Text((index + 1).toString()),
          ),
        );
      },
    );
  }
}
