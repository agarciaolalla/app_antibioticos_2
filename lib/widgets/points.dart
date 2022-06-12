import 'package:flutter/material.dart';

import '../utilidades/constantes.dart';

class Point extends StatefulWidget {
  const Point({Key? key}) : super(key: key);

  @override
  State<Point> createState() => PointState();
}

class PointState extends State<Point> {
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
                value: pointsBar, // percent filled
                valueColor: const AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 24, 95, 218)),
                backgroundColor: const Color(0xffD6D6D6),
              ),
            ),
            Align(
              child: Text(
                "Has conseguido: " +
                    points.toString() +
                    "de :" +
                    maxPoints.toString(),
                style: const TextStyle(fontSize: 17, color: Colors.black),
              ),
              alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
    );
  }
}
