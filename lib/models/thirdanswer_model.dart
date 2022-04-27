// To parse this JSON data, do
//
//     final thirdanswer = thirdanswerFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/rendering.dart';

Thirdanswer thirdanswerFromJson(String str) =>
    Thirdanswer.fromJson(json.decode(str));

String thirdanswerToJson(Thirdanswer data) => json.encode(data.toJson());

class Thirdanswer {
  Thirdanswer({
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

  factory Thirdanswer.fromJson(Map<String, dynamic> json) => Thirdanswer(
        idCaso: json["idcaso"],
        antibiotico: json["antibiotico"],
        duracion: json["duracion"],
        intervalo: json["intervalo"],
        cantidad: json["cantidad"],
      );

  Map<String, dynamic> toJson() => {
        "idcaso": idCaso,
        "antibiotico": antibiotico,
        "duracion": duracion,
        "intervalo": intervalo,
        "cantidad": cantidad,
      };
}
