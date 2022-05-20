import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/html/html.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/screens/screens.dart';

class DiagnosticFeedback extends StatefulWidget {
  const DiagnosticFeedback({Key? key}) : super(key: key);

  @override
  State<DiagnosticFeedback> createState() => _DiagnosticFeedbackState();
}

class _DiagnosticFeedbackState extends State<DiagnosticFeedback> {
  String feedback = '';

  @override
  void initState() {
    super.initState();
    getDiagnosticFeedback();
  }

  Future getDiagnosticFeedback() async {
    List returnlista = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/diagnostic_feedback"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnlista = data['diagnostic_feedback'];

      for (var i = 0; i < returnlista.length; i++) {
        if (returnlista[i]["idcaso"] == idcaso.toString()) {
          feedback = returnlista[i]["feedback"];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solución'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: DiagnosticFeedbackHtml(feedback: feedback),
            ),
            FloatingActionButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FirstTreatmentScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
