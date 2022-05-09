import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/html/html.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

class SecondQuestionScreen extends StatefulWidget {
  const SecondQuestionScreen({Key? key}) : super(key: key);

  @override
  State<SecondQuestionScreen> createState() => _SecondQuestionScreenState();
}

class _SecondQuestionScreenState extends State<SecondQuestionScreen> {
  @override
  void initState() {
    super.initState();
  }

  String idCaso = "1";
  String question = "";

  Future getSecondQuestion() async {
    List returnList = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/secondquestion"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnList = data['secondquestion'];

      for (int i = 0; i < returnList.length; i++) {
        if (returnList[i]["idcaso"] == idCaso) {
          question = returnList[i]["pregunta"];
        }
      }
    });
  }

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
            const SecondQuestionHtml(),
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
