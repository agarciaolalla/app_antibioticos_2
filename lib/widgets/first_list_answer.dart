import 'package:flutter/material.dart';

import 'package:app_antibioticos/models/models.dart';

class FirstListAnswer extends StatelessWidget {
  FirstListAnswer(
      { //required this.firstAnswer,
      required this.onTapDelete,
      required this.onTapEdit});
  //final FirstAnswer firstAnswer;
  final VoidCallback onTapEdit, onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 2.0,
        color: Colors.white,
        child: ListTile(
          title: Text('firstAnswer.respuesta'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(child: const Icon(Icons.edit), onTap: onTapEdit),
              GestureDetector(
                  child: const Icon(Icons.delete), onTap: onTapDelete)
            ],
          ),
        ));
  }
}
