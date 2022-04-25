class Player {
  var name;
  var surname;
  var points;

  Player({this.name, this.surname, this.points});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
        name: json['nombre'],
        surname: json['apellido'],
        points: json['puntuacion']);
  }
}
