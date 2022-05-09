import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class ThirdQuestionHtml extends StatelessWidget {
  const ThirdQuestionHtml(
      {Key? key,
      required this.informacion72h,
      required this.analisisDeControl,
      required this.informacionAdicional})
      : super(key: key);

  final String informacion72h;
  final String analisisDeControl;
  final String informacionAdicional;

  @override
  Widget build(BuildContext context) {
    final String html = '''<html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=2">
      </head>
      <body>
        <h1>Evolucion clínica</h1>
        <p>''' +
        informacion72h +
        '''</p>
        <p>''' +
        analisisDeControl +
        '''</p>
        <p>''' +
        informacionAdicional +
        '''</p>
        <h2>¿Qué tratamiento y qué duración recomiendas?</h2>
        <p>Seleccione los antibioticos que considere necesarios de la mochila</p>
      </body>
  </html>''';
    return Padding(
      padding: const EdgeInsets.all(20),
      child: HtmlWidget(html),
    );
  }
}
