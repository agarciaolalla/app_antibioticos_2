// To parse this JSON data, do
//
//     final thirdquestion = thirdquestionFromJson(jsonString);

import 'dart:convert';

Thirdquestion thirdquestionFromJson(String str) =>
    Thirdquestion.fromJson(json.decode(str));

String thirdquestionToJson(Thirdquestion data) => json.encode(data.toJson());

class Thirdquestion {
  Thirdquestion({
    required this.idCaso,
    required this.pregunta,
  });

  String idCaso;
  String pregunta;

  factory Thirdquestion.fromJson(Map<String, dynamic> json) => Thirdquestion(
        idCaso: json["idcaso"],
        pregunta: json["pregunta"],
      );

  Map<String, dynamic> toJson() => {
        "idcaso": idCaso,
        "pregunta": pregunta,
      };
}
