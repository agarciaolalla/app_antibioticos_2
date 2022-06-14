import 'package:app_antibioticos/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:app_antibioticos/services/player_peticion.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class LooseScreen extends StatelessWidget {
  const LooseScreen({Key? key, required this.informacion}) : super(key: key);

  final String informacion;

  final String creditos = '''<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=2">
    </head>
    <body>
      <h2>Créditos</h2>
      <p>Idea original y diseño de los casos: José Ramón Paño, Silvia Loscos, Galadriel Pellejero y Florencio García Latorre</p>
      <p>Ha coordinado el proyecto y su inclusión en las XX Jornadas de Calidad en Salud: Sonia Montaner</p>
      <p>La dirección técnica ha recaído en: Carlos Tellería</p>
      <p>Han diseñado y desarrollado el juego: Alejandro Soler y Alejandro García Olalla</p>
      <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">
        <img alt="Licencia Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" />
      </a>
      <br />Esta obra está bajo una <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Licencia Creative Commons Atribución-NoComercial-CompartirIgual 4.0 Internacional</a>
    </body>
 </html>''';

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
      body: ListView(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Fin de la partida.",
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                SizedBox(
                  width: 700,
                  height: 500,
                  child: RiveAnimation.asset(animation()),
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
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: HtmlWidget(
                    creditos,
                    textStyle:
                        const TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
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

  String animation() {
    if (vidaJugador <= 0) {
      return "assets/win.riv";
    } else {
      return "assets/loose.riv";
    }
  }

  updatePlayerStatus() {
    int medicines = searchPlayerMedicines();
    player.points = points.toString();

    player.medicines = medicines.toString();

    if (vidaJugador <= 0.0) {
      player.life = "0";
      idcaso--;
      player.challenges = idcaso.toString();
    } else {
      player.life = (vidaJugador * 100).toString();
      player.challenges = idcaso.toString();
    }

    modifyPlayer(player);
  }
}
