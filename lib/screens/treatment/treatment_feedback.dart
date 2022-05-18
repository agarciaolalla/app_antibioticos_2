import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/widgets/widgets.dart';

class TreatmentFeedback extends StatefulWidget {
  const TreatmentFeedback({Key? key}) : super(key: key);

  @override
  State<TreatmentFeedback> createState() => _TreatmentFeedbackState();
}

class _TreatmentFeedbackState extends State<TreatmentFeedback> {
  List firstTreatmentFeedback = [];

  String lastTreatmentFeedback = '';

  @override
  void initState() {
    super.initState();
    getFirstTreatmentFeedback();
    getLastTreatmentFeedback();
  }

  Future getFirstTreatmentFeedback() async {
    List returnlista = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/first_treatment_feedback"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnlista = data['first_treatment_feedback'];

      for (var i = 0; i < returnlista.length; i++) {
        if (returnlista[i]["idcaso"] == idcaso.toString()) {
          firstTreatmentFeedback.add(returnlista[i]);
        }
      }
    });
  }

  Future getLastTreatmentFeedback() async {
    List returnlista = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/last_treatment_feedback"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnlista = data['last_treatment_feedback'];

      for (var i = 0; i < returnlista.length; i++) {
        if (returnlista[i]["idcaso"] == idcaso.toString()) {
          lastTreatmentFeedback = returnlista[i]["feedback"];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (idTreatmentQuestion == 1) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Solución'),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: firstTreatmentFeedback.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  Text(firstTreatmentFeedback[index]["antibiotico"]),
                  Text(firstTreatmentFeedback[index]["dosis"]),
                  Text(firstTreatmentFeedback[index]["via"]),
                  Text(firstTreatmentFeedback[index]["intervalo"]),
                  Text(firstTreatmentFeedback[index]["activo"]),
                  Text(firstTreatmentFeedback[index]["comentario"]),
                  Text(firstTreatmentFeedback[index]["consecuencia"]),
                ],
              ),
            );
          },
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Solución'),
        ),
        body: const Text("solucion"),
      );
    }
  }
}
