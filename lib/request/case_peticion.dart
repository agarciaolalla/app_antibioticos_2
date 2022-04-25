import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:app_antibioticos/models/models.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

Future<List<Case>> listCasos() async {
  final response = await http.get(Uri.parse(conexion1 + "/api/case"));

  return compute(goToList, response.body);
}

List<Case> goToList(String responseBody) {
  final pasar = json.decode(responseBody);

  return pasar['case'].map<Case>((json) => Case.fromJson(json)).toList();
}

mapClient(Case caso) {
  Map data;

  data = {
    'numero': caso.numero,
  };

  return data;
}

//Future<List<Case>> getAllCases() async {
//  try {} catch (e) {
//    return [];
//  }
//}
