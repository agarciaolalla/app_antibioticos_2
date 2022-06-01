import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:app_antibioticos/screens/screens.dart';

import '../utilidades/constantes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getBackpack();
  }

  Future getBackpack() async {
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/backpack"));
    data = json.decode(response.body);

    setState(() {
      mochilaSeleccionada = data['backpack'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Column(
              children: const [
                Text(
                  "App Antibióticos",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
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
                              style: TextStyle(fontSize: 30),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) {
                                return const InitialInfoScreen();
                              }), (Route<dynamic> route) => false);
                            },
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            child: const Text(
                              'Ranking',
                              style: TextStyle(fontSize: 30),
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
          ),
        ));
  }
}
