import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:app_antibioticos/models/models.dart';

Future<List<Firstquestion>> listFirstQuestion() async {
  final response = await http.get(Uri.parse(conexion1 + "/api/firstquestion"));

  return compute(goToList, response.body);
}

List<Firstquestion> goToList(String responseBody) {
  final pasar = json.decode(responseBody);

  return pasar['case']
      .map<Firstquestion>((json) => Firstquestion.fromJson(json))
      .toList();
}
