import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/screens/screens.dart';

class TreatmentFeedback extends StatefulWidget {
  const TreatmentFeedback({Key? key, required this.selectedMedicines})
      : super(key: key);

  final List selectedMedicines;

  @override
  State<TreatmentFeedback> createState() => _TreatmentFeedbackState();
}

class _TreatmentFeedbackState extends State<TreatmentFeedback> {
  List treatmentFeedback = [];
  List feedbackToUser = [];
  int vidaPerdida = 0;
  String mostrarVidaPerdida = "";
  List<int> checkDays = [];
  String muerte = "El paciente ha muerto.";
  @override
  void initState() {
    super.initState();
    getTreatmentFeedback();
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
          treatmentFeedback.add(returnlista[i]);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < treatmentFeedback.length; i++) {
      for (int j = 0; j < widget.selectedMedicines.length; j++) {
        if (treatmentFeedback[i]["antibiotico"] ==
            widget.selectedMedicines[j]["antibiotico"]) {
          feedbackToUser.add(treatmentFeedback[i]);
          checkDays.add(int.parse(widget.selectedMedicines[j]["dias"]));
        }
      }
    }

    //En caso de que sea el tratamiento empirico (1ª vez)
    if (idTreatmentQuestion == 1) {
      firstTreatmentFeedback = List.from(feedbackToUser);
      setNewLifeFirstTreatment();
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          flexibleSpace: SafeArea(
            child: Column(
              children: [
                const Text(
                  "Feedback Tratamiento Empirico",
                  style: TextStyle(fontSize: 25),
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
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.info_outline),
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
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              const Life(),
              CardViewTreatmentFeedback(treatmentFeedback: feedbackToUser),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  mostrarVidaPerdida,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setBackpackDosesFirstTreatment();
                  idTreatmentQuestion++;
                  if (vidaJugador <= 0) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                      return LooseScreen(informacion: muerte);
                    }), (Route<dynamic> route) => false);
                  } else {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                      return const SecondTreatmentScreen();
                    }), (Route<dynamic> route) => false);
                  }
                },
                child: const Text(
                  'Continuar',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      );
      //En caso de que sea el tratamiento dirigido (2ª vez)
    } else {
      setNewLifeSecondTreatment();

      secondTreatmentFeedback = List.from(feedbackToUser);
      return Scaffold(
        appBar: AppBar(
          title: const Text('Feedback Tratamiento Dirigido'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              const Life(),
              CardViewTreatmentFeedback(treatmentFeedback: feedbackToUser),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  mostrarVidaPerdida,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  idTreatmentQuestion--;
                  if (vidaJugador <= 0) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                      return LooseScreen(informacion: muerte);
                    }), (Route<dynamic> route) => false);
                  } else {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                      return const FinalScreen();
                    }), (Route<dynamic> route) => false);
                  }
                },
                child: const Text(
                  'Continuar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  //Metodo para restar el consumo de los medicamentos utilizados en la mochila.
  void setBackpackDosesFirstTreatment() {
    for (int i = 0; i < feedbackToUser.length; i++) {
      for (int j = 0; j < mochilaSeleccionada.length; j++) {
        if (mochilaSeleccionada[j]["antibiotico"] ==
            feedbackToUser[i]["antibiotico"]) {
          int setDosis = int.parse(mochilaSeleccionada[j]["dias"]) -
              int.parse(feedbackToUser[i]["dias"]);
          mochilaSeleccionada[j]["dias"] = setDosis.toString();
        }
      }
    }
  }

  void setNewLifeFirstTreatment() {
    int vidaFirst = 0;
    for (int i = 0; i < feedbackToUser.length; i++) {
      int restar = int.parse(feedbackToUser[i]["vida"]);
      vidaFirst = vidaFirst + restar;
    }
    if (vidaFirst > 20) {
      vidaJugador = vidaJugador - 0.2;
      vidaPerdida = 20;
    } else {
      double vidaFinal = 0;
      vidaFinal = vidaFirst / 100;
      vidaJugador = vidaJugador - vidaFinal;
      vidaPerdida = vidaFirst;
      ajustarVidaPerdida();
    }
  }

  void setNewLifeSecondTreatment() {
    double vidaSecond = 0.0;
    for (int i = 0; i < feedbackToUser.length; i++) {
      if (feedbackToUser[i]["activo"] == 'No') {
        vidaSecond = vidaSecond + 0.2;
      } else {
        if (feedbackToUser[i]["via"] == 'Vía Oral') {
          if (int.parse(feedbackToUser[i]["dias"]) < checkDays[i]) {
            //No le penaliza la vida en este caso.
          } else {
            vidaSecond = vidaSecond + 0.1;
          }
        } else {
          if (int.parse(feedbackToUser[i]["dias"]) < checkDays[i]) {
            vidaSecond = vidaSecond + 0.1;
          } else {
            vidaSecond = vidaSecond + 0.2;
          }
        }
      }
    }
    if (vidaSecond > 0.2) {
      vidaSecond = 0.2;
    }
    vidaJugador = vidaJugador - vidaSecond;
    vidaPerdida = (vidaSecond * 100).toInt();
    ajustarVidaPerdida();
  }

  void ajustarVidaPerdida() {
    if (vidaPerdida == 0) {
      mostrarVidaPerdida = "¡Genial! El paciente no ha perdido vida.";
    } else {
      mostrarVidaPerdida =
          "El paciente ha perdido un " + vidaPerdida.toString() + "% de vida";
    }
  }
}
