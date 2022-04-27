import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:app_antibioticos/models/models.dart';

Future<List<Backpack>> listBackpack() async {
  final response = await http.get(Uri.parse(conexion1 + "/api/backpack"));

  return compute(goToListBackpack, response.body);
}

List<Backpack> goToListBackpack(String responseBody) {
  final pasar = json.decode(responseBody);

  return pasar['backpack']
      .map<Backpack>((json) => Backpack.fromJson(json))
      .toList();
}
