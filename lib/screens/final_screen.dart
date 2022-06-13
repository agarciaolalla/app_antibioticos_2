import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'screens.dart';
import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

class FinalScreen extends StatefulWidget {
  const FinalScreen({Key? key}) : super(key: key);

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  void initState() {
    super.initState();
    getTreatmentFeedback();
    finalscren();
  }

  Future getTreatmentFeedback() async {
    List returnlista = [];
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/treatment_feedback"));
    data = json.decode(response.body);

    setState(() {
      returnlista = data['treatment_feedback'];

      for (var i = 0; i < returnlista.length; i++) {
        if (returnlista[i]["idcaso"] == idcaso.toString()) {
          antibioticosSiguienteCaso.add(returnlista[i]);
        }
      }
    });
  }

  List antibioticosSiguienteCaso = [];
  bool suficientesAntibioticos = false;

  @override
  Widget build(BuildContext context) {
    vidaCaso = 0;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Fin del caso",
                style: TextStyle(
                    fontSize: 25, fontFamily: 'FjallaOne', color: Colors.black),
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
            //const ShowLife(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                comprobarMedicamentosSuficientes();
                if (!suficientesAntibioticos) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return const LooseScreen(
                      informacion:
                          "No tienes suficientes medicamentos para afrontar el siguiente caso.",
                    );
                  }), (Route<dynamic> route) => false);
                } else if (idcaso < 5) {
                  idcaso = idcaso + 1;
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return const InitialInfoScreen();
                  }), (Route<dynamic> route) => false);
                } else {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return const LooseScreen(
                      informacion: "¡Has finalizado la partida exitosamente!",
                    );
                  }), (Route<dynamic> route) => false);
                }
              },
              child: Text(
                mensajeBoton(),
                style: const TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void finalscren() {
    if (idcaso > 4) {
      screenfinal = true;
    }
  }

  String mensajeBoton() {
    if (idcaso < 5) {
      return "Siguiente caso";
    } else {
      return "Finalizar Partida";
    }
  }

  void comprobarMedicamentosSuficientes() {
    for (int i = 0; i < mochilaSeleccionada.length; i++) {
      for (int j = 0; j < antibioticosSiguienteCaso.length; j++) {
        if (mochilaSeleccionada[i]["antibiotico"] ==
            antibioticosSiguienteCaso[j]["antibiotico"]) {
          if (int.parse(mochilaSeleccionada[i]["dias"]) >=
              int.parse(antibioticosSiguienteCaso[j]["dias"])) {
            suficientesAntibioticos = true;
          }
        }
      }
    }
  }
}
