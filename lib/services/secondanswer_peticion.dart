import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:app_antibioticos/models/models.dart';

Future<List<Secondanswer>> listSecondAnswer() async {
  final response = await http.get(Uri.parse(conexion1 + "/api/secondanswer"));

  return compute(goToListSecondAnswer, response.body);
}

List<Secondanswer> goToListSecondAnswer(String responseBody) {
  final pasar = json.decode(responseBody);

  return pasar['secondanswer']
      .map<Secondquestion>((json) => Secondanswer.fromJson(json))
      .toList();
}
