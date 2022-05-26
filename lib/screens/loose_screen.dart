import 'package:flutter/material.dart';

import 'package:app_antibioticos/services/player_peticion.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

class LooseScreen extends StatelessWidget {
  const LooseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    updatePlayerStatus();
    print(player);
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

  updatePlayerStatus() {
    player.points = points.toString();
    player.challenges = idcaso.toString();

    for (int i = 0; i < mochilaSeleccionada.length; i++) {
      if (mochilaSeleccionada[i]["numerodosis"] > 0) {
        int medicamentosRestantes = int.parse(player.medicines) +
            int.parse(mochilaSeleccionada[i]["numerodosis"]);
        player.medicines = medicamentosRestantes.toString();
      }
    }

    modifyPlayer(player);
  }
}
