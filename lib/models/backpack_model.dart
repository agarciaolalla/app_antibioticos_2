// To parse this JSON data, do
//
//     final backpack = backpackFromJson(jsonString);

import 'dart:convert';

Backpack backpackFromJson(String str) => Backpack.fromJson(json.decode(str));

String backpackToJson(Backpack data) => json.encode(data.toJson());

class Backpack {
  Backpack({
    required this.nombre,
    required this.numero,
  });

  String nombre;
  String numero;

  factory Backpack.fromJson(Map<String, dynamic> json) => Backpack(
        nombre: json["nombre"],
        numero: json["numero"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "numero": numero,
      };
}
