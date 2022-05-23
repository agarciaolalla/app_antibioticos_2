import 'package:flutter/material.dart';

import '../utilidades/constantes.dart';

class ShowLife extends StatefulWidget {
  const ShowLife({Key? key}) : super(key: key);

  @override
  State<ShowLife> createState() => _ShowLifeState();
}

class _ShowLifeState extends State<ShowLife> {
  int showLife = (vidaJugador * 100).toInt();
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
              text: "Vida actual del paciente: " + showLife.toString() + "%",
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        ],
      ),
    );
  }
}
