import 'package:flutter/material.dart';

import 'package:app_antibioticos/screens/screens.dart';

class InitialInfo extends StatelessWidget {
  const InitialInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Información Inicial"),
        ),
        body: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text(
                            'Siguiente',
                            style: TextStyle(fontSize: 40),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstQuestion()),
                            );
                          },
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          child: const Text(
                            'Ranking',
                            style: TextStyle(fontSize: 40),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Ranking()),
                            );
                          },
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ));
  }
}
