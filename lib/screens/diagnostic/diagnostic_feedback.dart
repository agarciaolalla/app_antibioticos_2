import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/html/html.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/screens/screens.dart';

import '../../widgets/widgets.dart';

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
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Column(
            children: const [
              Text(
                "Feedback del Diagnóstico",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Life(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: DiagnosticFeedbackHtml(feedback: feedback),
            ),
            const ShowPoints(),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FirstTreatmentScreen(),
                ),
              ),
              child: const Text(
                "Continuar",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
