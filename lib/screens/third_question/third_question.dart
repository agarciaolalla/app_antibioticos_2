import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/html/html.dart';

class ThirdQuestionScreen extends StatefulWidget {
  const ThirdQuestionScreen({Key? key}) : super(key: key);

  @override
  State<ThirdQuestionScreen> createState() => _ThirdQuestionScreenState();
}

class _ThirdQuestionScreenState extends State<ThirdQuestionScreen> {
  @override
  void initState() {
    super.initState();
    getSecondQuestion();
  }

  String idCaso = "1";
  String info72h = "";
  String controlAnalysis = "";
  String aditionalInfo = "";

  Future getSecondQuestion() async {
    List returnList = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/thirdquestion"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnList = data['thirdquestion'];

      for (int i = 0; i < returnList.length; i++) {
        if (returnList[i]["idcaso"] == idCaso) {
          info72h = returnList[i]["informacion72h"];
          controlAnalysis = returnList[i]["analisisDeControl"];
          aditionalInfo = returnList[i]["informacionAdicional"];
        }
      }
    });
  }

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
            const Life(),
            const Timer(),
            ThirdQuestionHtml(
              informacion72h: info72h,
              analisisDeControl: controlAnalysis,
              informacionAdicional: aditionalInfo,
            ),
            //Widget que muestra la 'mochila' y la tabla dinamica
            const MedicinesForm()
          ],
        ),
      ),
    );
  }
}
