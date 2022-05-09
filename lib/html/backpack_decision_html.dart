import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class BackpackDecisionHtml extends StatelessWidget {
  const BackpackDecisionHtml({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String html = '''<html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=2">
      </head>
      <body>
        <h1>Seleccion de medicamentos</h1>
        <p>En base a los siguientes casos, seleccione los medicamentos que vea oportunos</p>
      </body>
  </html>''';
    return const Padding(
      padding: EdgeInsets.all(20),
      child: HtmlWidget(html),
    );
  }
}
