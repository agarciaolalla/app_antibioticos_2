import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class DiagnosticQuestionHtml extends StatelessWidget {
  const DiagnosticQuestionHtml({Key? key, required this.questionHtml})
      : super(key: key);

  final String questionHtml;

  @override
  Widget build(BuildContext context) {
    final String html = '''<html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=2">
      </head>
      <body>
        <h1>Solicitud de pruebas de diagnóstico</h1>
        ''' +
        questionHtml +
        '''
      </body>
  </html>''';
    return Padding(
      padding: const EdgeInsets.all(20),
      child: HtmlWidget(
        html,
        textStyle: const TextStyle(fontSize: 17, color: Colors.black),
      ),
    );
  }
}
