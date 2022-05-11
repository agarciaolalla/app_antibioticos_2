import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:app_antibioticos/html/html.dart';
import 'package:app_antibioticos/screens/screens.dart';

class ThirdFeedbackScreen extends StatelessWidget {
  ThirdFeedbackScreen({Key? key}) : super(key: key);

  final String thirdFeedbackHtml = Case1Html().thirdFeedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback tercera pregunta'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: HtmlWidget(thirdFeedbackHtml),
            ),
            FloatingActionButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FinalScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
