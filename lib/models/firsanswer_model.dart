// To parse this JSON data, do
//
//     final firstanswer = firstanswerFromJson(jsonString);

import 'dart:convert';

Firstanswer firstanswerFromJson(String str) =>
    Firstanswer.fromJson(json.decode(str));

String firstanswerToJson(Firstanswer data) => json.encode(data.toJson());

class Firstanswer {
  Firstanswer({
    required this.idCaso,
    required this.respuesta,
    required this.solucion,
  });

  String idCaso;
  String respuesta;
  String solucion;

  factory Firstanswer.fromJson(Map<String, dynamic> json) => Firstanswer(
        idCaso: json["id_caso"],
        respuesta: json["respuesta"],
        solucion: json["solucion"],
      );

  Map<String, dynamic> toJson() => {
        "id_caso": idCaso,
        "respuesta": respuesta,
        "solucion": solucion,
      };
}
