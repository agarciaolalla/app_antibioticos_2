import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class InitialInfoHtml extends StatelessWidget {
  const InitialInfoHtml({Key? key, required this.initialinfo})
      : super(key: key);

  final String initialinfo;

  @override
  Widget build(BuildContext context) {
    final String html = '''<html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=2">
      </head>
      <body>
        <h1>Caso numero ''' +
        idcaso.toString() +
        '''</h1>
        ''' +
        initialinfo +
        '''
      </body>
  </html>''';
    return Padding(
      padding: const EdgeInsets.all(20),
      child: HtmlWidget(
        html,
        textStyle: const TextStyle(fontSize: 17),
      ),
    );
  }
}
