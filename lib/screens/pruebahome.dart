import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../utilidades/constantes.dart';

class Prueba extends StatefulWidget {
  const Prueba({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Prueba> {
  @override
  void initState() {
    super.initState();
    getResponseMongo();
  }

  List listaDatos = [];

  Future getResponseMongo() async {
    Map data;
    http.Response response =
        await http.get(Uri.parse(conexion1 + "/api/firstanswer"));
    // debugPrint(response.body);
    data = json.decode(response.body);
    setState(() {
      listaDatos = data['firstanswer'];
    });
    // debugPrint(usersData.toString());
    debugPrint(listaDatos.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        backgroundColor: Colors.indigo[900],
      ),
      body: ListView.builder(
        itemCount: listaDatos == null ? 0 : listaDatos.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: <Widget>[
                  // Text("${usersData[index]["_id"]} - "),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "$index",
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${listaDatos[index]["respuesta"]} ${listaDatos[index]["solucion"]}",
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
