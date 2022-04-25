import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class InfoHtmlModel extends StatelessWidget {
  const InfoHtmlModel({Key? key}) : super(key: key);

  //ToDo: Request de la base de datos para sacar el html
  final String html = '''<html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=2">
      </head>
      <body>
        <h1>Informacion de la segunda pregunta</h1>
        <p>Esto es un html!!</p>
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
