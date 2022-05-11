import 'package:flutter/material.dart';

class Life extends StatefulWidget {
  const Life({Key? key}) : super(key: key);

  @override
  State<Life> createState() => LifeState();
}

class LifeState extends State<Life> {
  static double vida = 0.4;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: LinearProgressIndicator(
        backgroundColor: Colors.red,
        minHeight: 15,
        valueColor: const AlwaysStoppedAnimation(Colors.green),
        value: vida,
      ),
    );
  }
}
