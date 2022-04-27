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
        idCaso: json["idcaso"],
        pregunta: json["pregunta"],
      );

  Map<String, dynamic> toJson() => {
        "idcaso": idCaso,
        "pregunta": pregunta,
      };
}
