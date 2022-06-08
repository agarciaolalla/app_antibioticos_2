import 'package:flutter/material.dart';

import 'package:app_antibioticos/theme/app_theme.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

class BackpackDialog extends StatelessWidget {
  const BackpackDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Mochila"),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 400,
          height: 900,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: mochilaSeleccionada.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                shadowColor: AppTheme.primary.withOpacity(0.5),
                elevation: 30,
                child: ListTile(
                  leading: const Icon(Icons.medication_rounded),
                  title: Text(
                    mochilaSeleccionada[index]["antibiotico"],
                    style: const TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  subtitle: Text(
                      "\nDosis: " +
                          mochilaSeleccionada[index]["dosis"] +
                          "\nVía: " +
                          mochilaSeleccionada[index]["via"] +
                          "\nIntervalo: c/" +
                          mochilaSeleccionada[index]["intervalo"] +
                          "h" +
                          "\nCantidad restante: " +
                          mochilaSeleccionada[index]["dias"] +
                          " días disponibles",
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black)),
                ),
              );
            },
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              'Cerrar',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
