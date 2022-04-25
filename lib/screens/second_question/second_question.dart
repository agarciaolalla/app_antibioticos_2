import 'package:flutter/material.dart';

import 'package:app_antibioticos/widgets/widgets.dart';

class SecondQuestionScreen extends StatelessWidget {
  SecondQuestionScreen({Key? key}) : super(key: key);

  //ToDo Lista de medicinas que hay en la mochila
  final medicines = [
    'Seleccione un medicamento',
    'Ibuprofeno',
    'Paracetamol',
    'Aspirina',
    'Omeoprazol'
  ];
  //ToDo Tipo de dosis que tienes de cada medicina (hacerlo en base a la medicina seleccionada anteriormente)
  final doses = [
    'Seleccione una cantidad',
    '400',
    '600',
    '800',
    '1000',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda pregunta"),
        actions: [
          //Boton que muestra la informacion inicial del caso
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const ModalInfo(
                      title: 'Info inicial',
                      info:
                          'Ex qui ullamco ut labore cupidatat sit aliquip eiusmod quis nostrud esse ea esse. Elit commodo ipsum et dolor magna amet dolor cupidatat esse sint Lorem aute incididunt cupidatat. Sunt consequat exercitation ad exercitation incididunt ex laboris officia dolore.');
                },
              );
            },
            icon: const Icon(Icons.info_outline_rounded),
          ),
          //Espacio entre los botones
          const SizedBox(width: 20),
          //Boton que muestra lo seleccionado en la pregunta anterior + feedbacks
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const ModalInfo(
                      title: 'Feedback primera pregunta',
                      info:
                          'Ex qui ullamco ut labore cupidatat sit aliquip eiusmod quis nostrud esse ea esse. Elit commodo ipsum et dolor magna amet dolor cupidatat esse sint Lorem aute incididunt cupidatat. Sunt consequat exercitation ad exercitation incididunt ex laboris officia dolore.');
                },
              );
            },
            icon: const Icon(Icons.feedback_outlined),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 30),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //ToDo: Implementacion de html via rest (widget para cada info)
            const InfoHtmlModel(),
            //Widget que muestra la 'mochila' y la tabla dinamica
            MedicinesForm(medicines: medicines, numberMedicines: doses),
            //Boton de confirmar
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Confirmar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
