import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:app_antibioticos/models/models.dart';

Future<List<Secondquestion>> listSecondQuestion() async {
  final response = await http.get(Uri.parse(conexion1 + "/api/secondquestion"));

  return compute(goToListSecondQuestion, response.body);
}

List<Secondquestion> goToListSecondQuestion(String responseBody) {
  final pasar = json.decode(responseBody);

  return pasar['secondquestion']
      .map<Secondquestion>((json) => Secondquestion.fromJson(json))
      .toList();
}
