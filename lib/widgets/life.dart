import 'package:flutter/material.dart';

import '../utilidades/constantes.dart';

class Life extends StatefulWidget {
  const Life({Key? key}) : super(key: key);

  @override
  State<Life> createState() => LifeState();
}

class LifeState extends State<Life> {
  @override
  void initState() {
    super.initState();
    changeColor();
  }

  MaterialColor color = Colors.green;
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
                valueColor: AlwaysStoppedAnimation<Color>(color),
                backgroundColor: const Color(0xffD6D6D6),
              ),
            ),
            Align(
              child: Text(
                "Vida: " + (vidaJugador * 100).toString() + "%",
                style: const TextStyle(fontSize: 17, color: Colors.black),
              ),
              alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
    );
  }

  void changeColor() {
    if ((vidaJugador * 100) > 50) {
      color = Colors.green;
    } else if ((vidaJugador * 100) > 20) {
      color = Colors.yellow;
    } else {
      color = Colors.red;
    }
  }
}
