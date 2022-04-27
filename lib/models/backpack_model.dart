// To parse this JSON data, do
//
//     final backpack = backpackFromJson(jsonString);

import 'dart:convert';

Backpack backpackFromJson(String str) => Backpack.fromJson(json.decode(str));

String backpackToJson(Backpack data) => json.encode(data.toJson());

class Backpack {
  Backpack({
    required this.idCaso,
    required this.nombre,
    required this.dosis,
    required this.numero,
  });

  String idCaso;
  String nombre;
  String dosis;
  String numero;

  factory Backpack.fromJson(Map<String, dynamic> json) => Backpack(
        idCaso: json["idcaso"],
        nombre: json["nombre"],
        dosis: json["dosis"],
        numero: json["numero"],
      );

  Map<String, dynamic> toJson() => {
        "idcaso": idCaso,
        "nombre": nombre,
        "dosis": dosis,
        "numero": numero,
      };
}
