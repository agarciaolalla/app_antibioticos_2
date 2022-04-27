import 'dart:convert';

Firstanswer firstanswerFromJson(String str) =>
    Firstanswer.fromJson(json.decode(str));

String firstanswerToJson(Firstanswer data) => json.encode(data.toJson());

class Firstanswer {
  Firstanswer({required this.idCaso, required this.solucion});

  String idCaso;
  String solucion;

  factory Firstanswer.fromJson(Map<String, dynamic> json) =>
      Firstanswer(idCaso: json["idcaso"], solucion: json["solucion"]);

  Map<String, dynamic> toJson() => {
        "idcaso": idCaso,
        "solucion": solucion,
      };
}
