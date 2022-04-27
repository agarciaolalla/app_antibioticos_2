import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:app_antibioticos/models/models.dart';

Future<List<Player>> listClient() async {
  final response = await http.get(Uri.parse(conexion1 + "/api/player"));

  return compute(goToListPlayer, response.body);
}

List<Player> goToListPlayer(String responseBody) {
  final pasar = json.decode(responseBody);

  return pasar['player'].map<Player>((json) => Player.fromJson(json)).toList();
}
