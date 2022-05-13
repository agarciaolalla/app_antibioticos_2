import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class ThirdQuestionHtml extends StatelessWidget {
  const ThirdQuestionHtml({Key? key, required this.pregunta}) : super(key: key);

  //Trozo de html sacado de la base de datos.
  final String pregunta;

  @override
  Widget build(BuildContext context) {
    final String html = '''<html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=2">
      </head>
      <body>
        <h1>Evolucion clínica</h1>
        ''' +
        pregunta +
        '''
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
