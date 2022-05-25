import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:app_antibioticos/models/models.dart';

Future<List<Player>> listPlayer() async {
  final response = await http.get(Uri.parse(conexion1 + "/api/player"));

  return compute(goToListPlayer, response.body);
}

List<Player> goToListPlayer(String responseBody) {
  final pasar = json.decode(responseBody);

  return pasar['player'].map<Player>((json) => Player.fromJson(json)).toList();
}

mapPlayer(Player player, bool mapId) {
  Map data;

  data = {
    'nombre': player.name,
    'apellido': player.surname,
    'puntuacion': player.points
  };

  return data;
}

Future<Player> addPlayer(Player player) async {
  var url = Uri.parse(conexion1 + "/api/player/registro");

  var body = json.encode(mapPlayer(player, false));

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'}, body: body);
  // print("${response}");

  if (response.statusCode == 200) {
    return Player.fromJson(jsonDecode(response.body)['player']);
  } else {
    throw Exception('Failed to load player');
  }
}

Future<Player> modifyPlayer(Player player) async {
  var url = Uri.parse(conexion1 + "/api/player/modificar");

  var body = json.encode(mapPlayer(player, true));
  //print(body);

  var response = await http.put(url,
      headers: {"Content-Type": "application/json"}, body: body);
  if (response.statusCode == 200) {
    return Player.fromJson(jsonDecode(response.body)['player']);
  } else {
    print(response.statusCode);
    throw Exception('Failed to modify player');
  }
}
