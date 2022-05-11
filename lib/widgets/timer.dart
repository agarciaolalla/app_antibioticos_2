import 'package:flutter/widgets.dart';

class Timer extends StatefulWidget {
  const Timer({Key? key, required this.medicines}) : super(key: key);

  final List medicines;

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
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget bodyData() {
    Center(
        child: AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Text(countText),
    ));

    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
