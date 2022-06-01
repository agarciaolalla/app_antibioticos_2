import 'package:flutter/material.dart';

import 'package:app_antibioticos/services/player_peticion.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

class LooseScreen extends StatelessWidget {
  const LooseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    updatePlayerStatus();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Column(
            children: const [
              Text(
                "Pantalla Final",
                style: TextStyle(fontSize: 25),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Has perdido",
                  style: TextStyle(fontSize: 25, color: Colors.red),
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
    player.life = vidaJugador.toString();
    player.medicines = medicines.toString();

    modifyPlayer(player);
  }
}
