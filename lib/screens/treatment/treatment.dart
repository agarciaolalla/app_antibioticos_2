import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/html/html.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

class TreatmentScreen extends StatefulWidget {
  const TreatmentScreen({Key? key}) : super(key: key);

  @override
  State<TreatmentScreen> createState() => TreatmentState();
}

class TreatmentState extends State<TreatmentScreen> {
  @override
  void initState() {
    super.initState();
    getTreatmentQuestion();
    getTreatmentAnswer();
  }

  List listAnswer = [];
  String question = "";

  Future getTreatmentQuestion() async {
    List returnList = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/treatment_question"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnList = data['treatment_question'];

      for (int i = 0; i < returnList.length; i++) {
        if (returnList[i]["idcaso"] == idcaso.toString()) {
          question = returnList[i]["pregunta"];
        }
      }
    });
  }

  Future getTreatmentAnswer() async {
    List returnlista = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/treatment_answer"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnlista = data['treatment_answer'];

      for (var i = 0; i < returnlista.length; i++) {
        if (returnlista[i]["idcaso"] == idcaso.toString()) {
          listAnswer.add(returnlista[i]);
        }
      }
    });
  }

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
            Life(),
            Timer(),
            Text("PREGUNTA"),
            //Widget que muestra la 'mochila' y la tabla dinamica (le pasamos que pregunta es para el navigator)
            MedicinesForm(idPregunta: 2)
          ],
        ),
      ),
    );
  }
}
