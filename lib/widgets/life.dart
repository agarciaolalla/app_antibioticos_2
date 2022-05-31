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
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 20,
              child: LinearProgressIndicator(
                value: vidaJugador, // percent filled
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
                backgroundColor: const Color(0xffD6D6D6),
              ),
            ),
            Align(
              child: Text(
                "Vida: " + (vidaJugador * 100).toString() + "%",
                style: const TextStyle(fontSize: 17),
              ),
              alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
    );
  }
}
