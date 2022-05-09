import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class SecondQuestionHtml extends StatelessWidget {
  const SecondQuestionHtml(
      {Key? key, required this.pregunta, required this.descripcion})
      : super(key: key);

  final String pregunta;
  final String descripcion;

  @override
  Widget build(BuildContext context) {
    final String html = '''<html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=2">
      </head>
      <body>
        <h1>''' +
        pregunta +
        '''</h1>
        <p>''' +
        descripcion +
        '''</p>
      </body>
  </html>''';
    return Padding(
      padding: const EdgeInsets.all(20),
      child: HtmlWidget(html),
    );
  }
}
