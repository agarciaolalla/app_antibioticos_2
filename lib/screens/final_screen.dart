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
        title: const Text('Solución'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Life(),
            const ShowPoints(),
            const ShowLife(),
            ElevatedButton(
              onPressed: () {
                idcaso = idcaso + 1;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Ranking(),
                  ),
                );
              },
              child: const Text(
                'Ranking',
                style: TextStyle(fontSize: 30),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                idcaso = idcaso + 1;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InitialInfoScreen(),
                  ),
                );
              },
              child: const Text(
                'Siguiente caso',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
