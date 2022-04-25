import 'package:flutter/material.dart';

import 'package:app_antibioticos/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("APP Antibióticos"),
        ),
        body: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Image(
                    image: AssetImage('assets/home.png'),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text(
                            'Jugar',
                            style: TextStyle(fontSize: 40),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondQuestionScreen()),
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
                                  builder: (context) => const Ranking()),
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
