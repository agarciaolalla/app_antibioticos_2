import 'package:app_antibioticos/models/models.dart';
import 'package:app_antibioticos/models/case_model.dart';
import 'package:app_antibioticos/request/case_peticion.dart';
import 'package:flutter/material.dart';

class Casos extends StatefulWidget {
  const Casos({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => HomeCasos();
}

class HomeCasos extends State<Casos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Casos"),
      ),
      body: getCasos(context, listCasos()),
    );
  }

  Widget getCasos(BuildContext context, Future<List<Case>> futureClient) {
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
                ? casoList(snapshot.data)
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

  Widget casoList(List<Case> jugadores) {
    return ListView.builder(
      itemCount: jugadores.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(jugadores[index].numero),
          leading: CircleAvatar(
            child: Text((index + 1).toString()),
          ),
        );
      },
    );
  }
}
