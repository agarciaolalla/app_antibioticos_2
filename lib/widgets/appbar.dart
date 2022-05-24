import 'package:flutter/material.dart';

class AppBarClass extends StatelessWidget {
  const AppBarClass({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80, //set your height
      flexibleSpace: SafeArea(
        child: Column(
          children: [
            Text(
              titulo,
              style: const TextStyle(fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: const Icon(Icons.backpack_outlined),
                    onPressed: () {}),
                IconButton(
                    icon: const Icon(Icons.telegram_outlined),
                    onPressed: () {}),
                IconButton(icon: const Icon(Icons.whatsapp), onPressed: () {}),
                IconButton(
                    icon: const Icon(Icons.facebook_outlined),
                    onPressed: () {}),
              ],
            ),
            // set your search bar setting
          ],
        ),
      ),
    );
  }
}
