// ignore_for_file: deprecated_member_use
import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ThirdQuestion extends StatelessWidget {
  ThirdQuestion({Key? key}) : super(key: key);

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
        title: const Text("Tercera pregunta"),
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
          //Boton que muestra lo seleccionado en la pregunta 1 + feedbacks
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
          //Espacio entre los botones
          const SizedBox(width: 20),
          //Boton que muestra lo seleccionado en la pregunta 2 + feedbacks
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const ModalInfo(
                      title: 'Feedback segunda pregunta',
                      info:
                          'Ex qui ullamco ut labore cupidatat sit aliquip eiusmod quis nostrud esse ea esse. Elit commodo ipsum et dolor magna amet dolor cupidatat esse sint Lorem aute incididunt cupidatat. Sunt consequat exercitation ad exercitation incididunt ex laboris officia dolore.');
                },
              );
            },
            icon: const Icon(Icons.feedback_sharp),
          ),
          //Espacio entre los botones
          const SizedBox(width: 20),
          const Padding(
            padding: EdgeInsets.only(right: 30),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Informacion de la pregunta
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Minim officia sint deserunt culpa velit elit voluptate Lorem. Labore amet cillum magna cillum enim adipisicing do veniam ea Lorem voluptate sunt cillum. Cupidatat ipsum culpa aliquip ipsum laboris labore eiusmod esse magna deserunt tempor Lorem cillum qui. Minim occaecat id laboris non reprehenderit velit deserunt eiusmod. Laborum nulla dolor et consectetur id aute magna commodo aliqua eiusmod nostrud pariatur. Qui officia ipsum ex pariatur. Consequat enim consectetur cillum culpa Lorem cillum adipisicing eu Lorem fugiat aliqua adipisicing consequat quis. Irure ea excepteur ea est labore laborum occaecat irure incididunt aliqua laboris consectetur excepteur excepteur. Irure dolor est anim sunt consectetur consectetur. Cupidatat cillum eu velit enim officia et mollit ex elit.',
                style: TextStyle(fontSize: 20),
              ),
            ),
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
