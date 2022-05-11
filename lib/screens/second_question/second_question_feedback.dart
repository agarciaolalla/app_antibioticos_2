import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:app_antibioticos/html/html.dart';
import 'package:app_antibioticos/screens/screens.dart';

class SecondFeedbackScreen extends StatelessWidget {
  SecondFeedbackScreen({Key? key}) : super(key: key);

  final String secondFeedbackHtml = Case1Html().secondFeedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback segunda pregunta'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: HtmlWidget(secondFeedbackHtml),
            ),
            FloatingActionButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ThirdQuestionScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
