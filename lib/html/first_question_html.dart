import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class FirstQuestionHtml extends StatelessWidget {
  const FirstQuestionHtml({Key? key, required this.pregunta}) : super(key: key);

  final String pregunta;

  @override
  Widget build(BuildContext context) {
    final String html = '''<html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=2">
      </head>
      <body>
        <h1>Pruebas diagnosticas</h1>
        ''' +
        pregunta +
        '''
      </body>
  </html>''';
    return Padding(
      padding: const EdgeInsets.all(20),
      child: HtmlWidget(html),
    );
  }
}
