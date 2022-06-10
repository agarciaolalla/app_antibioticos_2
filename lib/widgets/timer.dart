import 'package:flutter/material.dart';

import 'package:app_antibioticos/screens/screens.dart';

import '../utilidades/constantes.dart';

class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  State<Timer> createState() => TimerState();
}

class TimerState extends State<Timer> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 300), vsync: this);
    controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
    controller.addListener(() {
      if (controller.value == 0) {
        alerta();
      }
    });
  }

  void alerta() {
    showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
              content: const Text(
                'Aunque esté bien reflexionar sobre el caso, hay que tomar las decisiones mas rápido. \nTu paciente ha perdido un 20% de vida, pasarás al siguiente caso.',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return const FinalScreen();
                  }), (Route<dynamic> route) => false),
                  child: const Text(
                    'OK',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              ],
            ));
    int precision = 10;
    int diff = (vidaJugador * precision).round() - (0.2 * precision).round();
    vidaJugador = diff / precision;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Text(
          "Tiempo restante: " + countText,
          style: const TextStyle(fontSize: 17, color: Colors.black),
        ),
      ),
    ]);
  }
}
