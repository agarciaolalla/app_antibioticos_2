import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/html/html.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/screens/screens.dart';
import 'package:app_antibioticos/widgets/widgets.dart';

class DiagnosticFeedback extends StatefulWidget {
  const DiagnosticFeedback({Key? key}) : super(key: key);

  @override
  State<DiagnosticFeedback> createState() => _DiagnosticFeedbackState();
}

class _DiagnosticFeedbackState extends State<DiagnosticFeedback> {
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
          diagnosticFeedback = returnlista[i]["feedback"];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Column(
            children: [
              const Text(
                "Feedback del diagnóstico",
                style: TextStyle(
                    fontSize: 25, fontFamily: 'FjallaOne', color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset("assets/backpack.png"),
                    tooltip: "Mochila",
                    iconSize: 50,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const BackpackDialog();
                        },
                      );
                    },
                  ),
                  IconButton(
                    icon: Image.asset("assets/initialInfoIcon.png"),
                    tooltip: "Información Inicial",
                    iconSize: 50,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const InitialInfoDialog();
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Life(),
            const Point(),
            const ShowPoints(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: DiagnosticFeedbackHtml(feedback: diagnosticFeedback),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return const FirstTreatmentScreen();
                  },
                ), (Route<dynamic> route) => false);
              },
              child: const Text(
                "Continuar",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
