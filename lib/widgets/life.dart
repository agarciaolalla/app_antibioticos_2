import 'package:flutter/material.dart';

import '../utilidades/constantes.dart';

class Life extends StatefulWidget {
  const Life({Key? key}) : super(key: key);

  @override
  State<Life> createState() => LifeState();
}

class LifeState extends State<Life> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: LinearProgressIndicator(
            backgroundColor: Colors.red,
            minHeight: 15,
            valueColor: const AlwaysStoppedAnimation(Colors.green),
            value: vidaJugador,
          ),
        ),
      ],
    );
  }
}
