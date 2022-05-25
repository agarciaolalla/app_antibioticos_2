import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/screens/screens.dart';
import 'package:app_antibioticos/html/html.dart';
import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

class InitialInfoScreen extends StatefulWidget {
  const InitialInfoScreen({Key? key}) : super(key: key);

  @override
  State<InitialInfoScreen> createState() => _InitialInfoScreenState();
}

class _InitialInfoScreenState extends State<InitialInfoScreen> {
  @override
  void initState() {
    super.initState();
    getInitialInfo();
  }

  String html = "";

  Future getInitialInfo() async {
    List returnlista = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/initial_info"));
    // debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      returnlista = data['initial_info'];

      for (var i = 0; i < returnlista.length; i++) {
        if (returnlista[i]["idcaso"] == idcaso.toString()) {
          html = returnlista[i]["info"];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const BackpackDialog();
                },
              );
            },
            icon: const Icon(Icons.backpack),
          ),
        ],
        flexibleSpace: SafeArea(
          child: Column(
            children: const [
              Text(
                "Información Inicial",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: InitialInfoHtml(initialinfo: html),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DiagnosticScreen(),
                ),
              ),
              child: const Text(
                "Continuar",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
