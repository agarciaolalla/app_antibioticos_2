import 'dart:convert';

import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:app_antibioticos/models/models.dart';

Future<List<Thirdanswer>> listThirdAnswer() async {
  final response = await http.get(Uri.parse(conexion1 + "/api/thirdanswer"));

  return compute(goToList, response.body);
}

List<Thirdanswer> goToList(String responseBody) {
  final pasar = json.decode(responseBody);

  return pasar['thirdanswer']
      .map<Thirdanswer>((json) => Thirdanswer.fromJson(json))
      .toList();
}
