import 'package:flutter/material.dart';

import 'package:app_antibioticos/widgets/widgets.dart';

class ModalInfo extends StatelessWidget {
  const ModalInfo({
    Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: const [
            Padding(padding: EdgeInsets.only(bottom: 10), child: Divider()),
            InfoHtmlModel()
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              'Cerrar',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
