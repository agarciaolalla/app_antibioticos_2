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
          width: 300,
          height: 300,
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
                  title: Text(mochilaSeleccionada[index]["antibiotico"]),
                  subtitle: Text("\nDosis: " +
                      mochilaSeleccionada[index]["dosis"] +
                      "\nVia: " +
                      mochilaSeleccionada[index]["via"] +
                      "\nIntervalo: " +
                      mochilaSeleccionada[index]["intervalo"] +
                      "h/" +
                      mochilaSeleccionada[index]["dias"] +
                      "\nCantidad restante: " +
                      mochilaSeleccionada[index]["numerodosis"] +
                      " usos disponibles"),
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
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
