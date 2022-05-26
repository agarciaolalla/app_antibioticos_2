import 'package:flutter/material.dart';

import '../utilidades/constantes.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class LooseScreen extends StatelessWidget {
  const LooseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Column(
              children: const [
                Text(
                  "Pantalla Final",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Has perdido",
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
