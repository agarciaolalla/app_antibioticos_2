import 'package:app_antibioticos/screens/final_screen.dart';
import 'package:flutter/material.dart';

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
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
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
                  'El tiempo de este caso clínico se ha acabado, pasarás al siguiente caso.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FinalScreen()),
                  ),
                  child: const Text('OK'),
                ),
              ],
            ));
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
        builder: (context, child) => Text(countText),
      ),
    ]);
  }
}
