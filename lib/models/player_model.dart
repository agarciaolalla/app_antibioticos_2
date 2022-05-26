import 'dart:convert';

Player playerFromJson(String str) => Player.fromJson(json.decode(str));

String playerToJson(Player data) => json.encode(data.toJson());

class Player {
  Player({
    required this.name,
    required this.surname,
    required this.points,
    required this.challenges,
    required this.medicines,
    required this.life,
  });
  String name;
  String surname;
  String points;
  String challenges;
  String medicines;
  String life;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        name: json["nombre"],
        surname: json["apellido"],
        points: json["puntuacion"],
        challenges: json["retoscompletados"],
        medicines: json["antibioticostotales"],
        life: json["vida"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": name,
        "apellido": surname,
        "puntuacion": points,
        "retoscompletados": challenges,
        "antibioticostotales": medicines,
        "vida": life,
      };
}
