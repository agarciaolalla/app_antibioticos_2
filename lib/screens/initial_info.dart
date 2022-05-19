import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:app_antibioticos/html/html.dart';
import 'package:app_antibioticos/screens/screens.dart';

class InitialInfoScreen extends StatelessWidget {
  const InitialInfoScreen({Key? key}) : super(key: key);

  final String initialInfoHtml = " AQUÍ TIENE QUE IR EL HTML DE INFO INICIAL";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informacion inicial'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: HtmlWidget(initialInfoHtml),
            ),
            FloatingActionButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FirstTreatmentScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
