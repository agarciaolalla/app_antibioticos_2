import 'package:flutter/material.dart';

import 'package:app_antibioticos/models/models.dart';
import 'package:app_antibioticos/services/backpack_peticion.dart';
import 'package:app_antibioticos/widgets/widgets.dart';

class BackpackDecisionScreen extends StatelessWidget {
  const BackpackDecisionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccion de medicamentos'),
      ),
      body: getBackpack(context, listBackpack()),
    );
  }

  Widget getBackpack(
      BuildContext context, Future<List<Backpack>> futureClient) {
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
                ? backpackSelected(snapshot.data)
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

  Widget backpackSelected(List<Backpack> mochila) {
    return ListView.builder(
      itemCount: mochila.length,
      itemBuilder: (context, index) {
        return ListTileItem(
          title: mochila[index].nombre,
          cantidadMaxima: mochila[index].numero,
        );
      },
    );
  }
}
