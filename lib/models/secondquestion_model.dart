// To parse this JSON data, do
//
//     final secondquestion = secondquestionFromJson(jsonString);

import 'dart:convert';

Secondquestion secondquestionFromJson(String str) =>
    Secondquestion.fromJson(json.decode(str));

String secondquestionToJson(Secondquestion data) => json.encode(data.toJson());

class Secondquestion {
  Secondquestion({
    required this.idCaso,
    required this.pregunta,
  });

  String idCaso;
  String pregunta;

  factory Secondquestion.fromJson(Map<String, dynamic> json) => Secondquestion(
        idCaso: json["id_caso"],
        pregunta: json["pregunta"],
      );

  Map<String, dynamic> toJson() => {
        "id_caso": idCaso,
        "pregunta": pregunta,
      };
}
