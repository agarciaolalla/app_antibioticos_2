import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:app_antibioticos/models/models.dart';

Future<List<Firstanswer>> listFirstAnswer() async {
  final response = await http.get(Uri.parse(conexion1 + "/api/firstanswer"));

  return compute(goToListFirstAnswer, response.body);
}

List<Firstanswer> goToListFirstAnswer(String responseBody) {
  final pasar = json.decode(responseBody);

  return pasar['firstanswer']
      .map<Firstanswer>((json) => Firstanswer.fromJson(json))
      .toList();
}
