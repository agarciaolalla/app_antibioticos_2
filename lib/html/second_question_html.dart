import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class SecondQuestionHtml extends StatelessWidget {
  const SecondQuestionHtml({Key? key}) : super(key: key);

  final String html = '''<html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=2">
      </head>
      <body>
        <h1>¿Qué tratamiento antibiótico cree indicado?</h1>
        <p>Con los datos proporcionados anteriormente, seleccione los antibioticos que considere necesarios de la mochila</p>
      </body>
  </html>''';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: HtmlWidget(html),
    );
  }
}
