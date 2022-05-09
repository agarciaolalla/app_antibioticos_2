import 'dart:convert';

Player playerFromJson(String str) => Player.fromJson(json.decode(str));

String playerToJson(Player data) => json.encode(data.toJson());

class Player {
  Player({
    required this.name,
    required this.surname,
    required this.points,
  });
  String name;
  String surname;
  String points;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        name: json["nombre"],
        surname: json["apellido"],
        points: json["puntuacion"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": name,
        "apellido": surname,
        "puntuacion": points,
      };
}
