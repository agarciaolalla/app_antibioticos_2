import 'dart:convert';

Firstquestion firstquestionFromJson(String str) =>
    Firstquestion.fromJson(json.decode(str));

String firstquestionToJson(Firstquestion data) => json.encode(data.toJson());

class Firstquestion {
  Firstquestion({
    required this.idCaso,
    required this.pregunta,
  });

  String idCaso;
  String pregunta;

  factory Firstquestion.fromJson(Map<String, dynamic> json) => Firstquestion(
        idCaso: json["idcaso"],
        pregunta: json["pregunta"],
      );

  Map<String, dynamic> toJson() => {
        "idcaso": idCaso,
        "pregunta": pregunta,
      };
}
