import 'package:app_antibioticos/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:app_antibioticos/screens/screens.dart';

class InitialInfoScreen extends StatelessWidget {
  const InitialInfoScreen({Key? key}) : super(key: key);

  final String initialInfoHtml = " AQUÍ TIENE QUE IR EL HTML DE INFO INICIAL";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
<<<<<<< HEAD
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const BackpackDialog();
                },
              );
            },
            icon: const Icon(Icons.backpack),
          ),
        ],
=======
        flexibleSpace: SafeArea(
          child: Column(
            children: const [
              Text(
                "Información Inicial",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
>>>>>>> 2641229f89fe30aacbe4a007d8d7f82ab2d53838
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: HtmlWidget(initialInfoHtml),
            ),
            FloatingActionButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DiagnosticScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
