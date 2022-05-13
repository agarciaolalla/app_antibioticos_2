import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class DiagnosticFeedbackHtml extends StatelessWidget {
  const DiagnosticFeedbackHtml({Key? key, required this.feedback})
      : super(key: key);

  final String feedback;

  @override
  Widget build(BuildContext context) {
    final String html = '''<html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=2">
      </head>
      <body>
        <h1>Feedback pruebas diagnosticas</h1>
        ''' +
        feedback +
        '''
      </body>
  </html>''';
    return Padding(
      padding: const EdgeInsets.all(20),
      child: HtmlWidget(html),
    );
  }
}
