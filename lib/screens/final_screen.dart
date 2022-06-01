import 'package:flutter/material.dart';

import '../utilidades/constantes.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Column(
            children: const [
              Text(
                "Fin del caso",
                style: TextStyle(fontSize: 25),
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
                idcaso = idcaso + 1;
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return InitialInfoScreen();
                }), (Route<dynamic> route) => false);
              },
              child: const Text(
                'Siguiente caso',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
