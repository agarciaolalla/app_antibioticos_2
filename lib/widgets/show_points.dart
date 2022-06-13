import 'package:flutter/material.dart';

import '../utilidades/constantes.dart';

class ShowPoints extends StatefulWidget {
  const ShowPoints({Key? key}) : super(key: key);

  @override
  State<ShowPoints> createState() => ShowPointsState();
}

class ShowPointsState extends State<ShowPoints> {
  String mostrarPuntuacion = "Puntuación actual obtenida: ";
  int mostrarPuntos = pointsPerCase;
  @override
  Widget build(BuildContext context) {
    if (screenfinal == true) {
      mostrarPuntuacion = 'Puntuación final obtenida: ';
      mostrarPuntos = points;
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
                text: mostrarPuntuacion + mostrarPuntos.toString() + " punto/s",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
