import 'dart:convert';

Firstanswer firstanswerFromJson(String str) =>
    Firstanswer.fromJson(json.decode(str));

String firstanswerToJson(Firstanswer data) => json.encode(data.toJson());

class Firstanswer {
  Firstanswer(
      {required this.idCaso, required this.respuesta, required this.solucion});

  String idCaso;
  String respuesta;
  String solucion;

  factory Firstanswer.fromJson(Map<String, dynamic> json) => Firstanswer(
      idCaso: json["idcaso"],
      respuesta: json["respuesta"],
      solucion: json["solucion"]);

  Map<String, dynamic> toJson() => {
        "idcaso": idCaso,
        "respuesta": respuesta,
        "solucion": solucion,
      };
}
