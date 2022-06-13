import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:rive/rive.dart';

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
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "App Antibióticos",
                style: TextStyle(
                    fontSize: 25, fontFamily: 'FjallaOne', color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 700,
                  height: 700,
                  child: RiveAnimation.asset(
                    "animations/gang.riv",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text(
                    "Bienvenido a 'Un botiquín en mi mochila'."
                    "\nTienes unos cuantos antibióticos en tu mochila, para ir a visitar a cinco pacientes a los que tendrás que diagnosticar y tratar."
                    "\n¡Ojo! Los antibióticos de tu mochila son limitados, y tendrás que administrarlos con prudencia y sabiduría. Si utilizas demasiados, te quedarás pronto con la mochila vacía, y el juego terminará. Si utilizas pocos o los que usas no son los más adecuados, no curarás al paciente, y el pobrecito irá perdiendo vida. ¡No dejes que muera!"
                    "\nEn todo momento podrás verificar el contenido de tu mochila y los datos diagnósticos y analíticos de cada caso. Si aciertas las preguntas que te iremos planteando, irás sumando puntos.\nCuantos más retos superes, cuantos más puntos consigas, cuanta más vida tenga tu paciente, más arriba estarás en el ranking de los TOP PROA."
                    "\nÁnimo. Su vida está en tus manos.",
                    style: TextStyle(
                        color: Colors.black, fontSize: 20, wordSpacing: 5),
                    //textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: const Text(
                          'Jugar',
                          style: TextStyle(fontSize: 30, color: Colors.black),
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
                          style: TextStyle(fontSize: 30, color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Ranking()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
