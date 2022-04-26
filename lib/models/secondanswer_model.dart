// To parse this JSON data, do
//
//     final secondanswer = secondanswerFromJson(jsonString);

import 'dart:convert';

Secondanswer secondanswerFromJson(String str) =>
    Secondanswer.fromJson(json.decode(str));

String secondanswerToJson(Secondanswer data) => json.encode(data.toJson());

class Secondanswer {
  Secondanswer({
    required this.idCaso,
    required this.antibiotico,
    required this.duracion,
    required this.intervalo,
    required this.cantidad,
  });

  String idCaso;
  String antibiotico;
  String duracion;
  String intervalo;
  String cantidad;

  factory Secondanswer.fromJson(Map<String, dynamic> json) => Secondanswer(
        idCaso: json["id_caso"],
        antibiotico: json["antibiotico"],
        duracion: json["duracion"],
        intervalo: json["intervalo"],
        cantidad: json["cantidad"],
      );

  Map<String, dynamic> toJson() => {
        "id_caso": idCaso,
        "antibiotico": antibiotico,
        "duracion": duracion,
        "intervalo": intervalo,
        "cantidad": cantidad,
      };
}
