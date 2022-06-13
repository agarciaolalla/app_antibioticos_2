import 'package:app_antibioticos/screens/screens.dart';
import 'package:flutter/material.dart';

import 'package:app_antibioticos/services/player_peticion.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

class LooseScreen extends StatelessWidget {
  const LooseScreen({Key? key, required this.informacion}) : super(key: key);

  final String informacion;

  @override
  Widget build(BuildContext context) {
    updatePlayerStatus();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Pantalla Final",
                style: TextStyle(
                    fontSize: 25, fontFamily: 'FjallaOne', color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Fin de la partida.",
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                Text(
                  informacion,
                  style: const TextStyle(fontSize: 25, color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                      return const Ranking();
                    }), (Route<dynamic> route) => false);
                  },
                  child: const Text(
                    'Ranking',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  int searchPlayerMedicines() {
    int medicamentos = 0;
    if (mochilaSeleccionada != []) {
      for (int i = 0; i < mochilaSeleccionada.length; i++) {
        if (int.parse(mochilaSeleccionada[i]["dias"]) > 0) {
          medicamentos =
              medicamentos + int.parse(mochilaSeleccionada[i]["dias"]);
        }
      }
    }
    return medicamentos;
  }

  updatePlayerStatus() {
    int medicines = searchPlayerMedicines();
    player.points = points.toString();
    player.challenges = idcaso.toString();
    player.medicines = medicines.toString();

    if (vidaJugador <= 0.0) {
      player.life = "0";
    } else {
      player.life = (vidaJugador * 100).toString();
    }

    modifyPlayer(player);
  }
}
