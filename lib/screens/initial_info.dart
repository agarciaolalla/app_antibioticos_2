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

  String asset = "";

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
          initialInfo = returnlista[i]["info"];
          asset = returnlista[i]["imagen"];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: SafeArea(
          child: Column(
            children: [
              const Text(
                "Información Inicial",
                style: TextStyle(
                    fontSize: 25, fontFamily: 'FjallaOne', color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: const Icon(Icons.backpack_outlined),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const BackpackDialog();
                          },
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                children: [
                  InitialInfoHtml(initialinfo: initialInfo),
                  showAssets(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return const DiagnosticScreen();
              }), (Route<dynamic> route) => false),
              child: const Text(
                "Continuar",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  //Metodo para buscar si el caso tiene alguna imagen, en caso de que si mostrarla en un dialog.
  Widget showAssets() {
    if (asset != "") {
      return ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Imagen Adjunta'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    )
                  ],
                ),
                content: SingleChildScrollView(
                  child: Image(image: AssetImage(asset)),
                ),
              );
            },
          );
        },
        child: const Text(
          "Imagen Adjunta",
          style: TextStyle(fontSize: 20),
        ),
      );
    }
    return const SizedBox();
  }
}
