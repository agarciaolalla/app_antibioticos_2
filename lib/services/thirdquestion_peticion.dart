import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:app_antibioticos/models/models.dart';

Future<List<Thirdquestion>> listThirdQuestion() async {
  final response = await http.get(Uri.parse(conexion1 + "/api/thirdquestion"));

  return compute(goToListThirdQuestion, response.body);
}

List<Thirdquestion> goToListThirdQuestion(String responseBody) {
  final pasar = json.decode(responseBody);

  return pasar['thirdquestion']
      .map<Thirdquestion>((json) => Thirdquestion.fromJson(json))
      .toList();
}
