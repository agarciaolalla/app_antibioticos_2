import 'package:flutter/material.dart';

import 'screens.dart';
import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    vidaCaso = 0;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Column(
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
            const ShowPoints(),
            const ShowLife(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (idcaso < 5) {
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
              child: const Text(
                'Siguiente caso',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
