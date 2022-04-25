// To parse this JSON data, do
//
//     final case = caseFromJson(jsonString);

import 'dart:convert';

Case caseFromJson(String str) => Case.fromJson(json.decode(str));

String caseToJson(Case data) => json.encode(data.toJson());

class Case {
  Case({
    required this.numero,
    required this.primerapregunta,
    required this.segundapregunta,
    required this.tercerapregunta,
    required this.mochila,
  });

  String numero;
  Primerapregunta primerapregunta;
  Apregunta segundapregunta;
  Apregunta tercerapregunta;
  Mochila mochila;

  factory Case.fromJson(Map<String, dynamic> json) => Case(
        numero: json["numero"],
        primerapregunta: Primerapregunta.fromJson(json["primerapregunta"]),
        segundapregunta: Apregunta.fromJson(json["segundapregunta"]),
        tercerapregunta: Apregunta.fromJson(json["tercerapregunta"]),
        mochila: Mochila.fromJson(json["mochila"]),
      );

  Map<String, dynamic> toJson() => {
        "numero": numero,
        "primerapregunta": primerapregunta.toJson(),
        "segundapregunta": segundapregunta.toJson(),
        "tercerapregunta": tercerapregunta.toJson(),
        "mochila": mochila.toJson(),
      };
}

class Mochila {
  Mochila({
    required this.antibiotico,
  });

  List<Antibiotico> antibiotico;

  factory Mochila.fromJson(Map<String, dynamic> json) => Mochila(
        antibiotico: List<Antibiotico>.from(
            json["antibiotico"].map((x) => Antibiotico.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "antibiotico": List<dynamic>.from(antibiotico.map((x) => x.toJson())),
      };
}

class Antibiotico {
  Antibiotico({
    required this.nombre,
    required this.dosis,
    required this.numero,
  });

  String nombre;
  String dosis;
  String numero;

  factory Antibiotico.fromJson(Map<String, dynamic> json) => Antibiotico(
        nombre: json["nombre"],
        dosis: json["dosis"],
        numero: json["numero"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "dosis": dosis,
        "numero": numero,
      };
}

class Primerapregunta {
  Primerapregunta({
    required this.pregunta,
    required this.respuestas,
  });

  String pregunta;
  List<PrimerapreguntaRespuesta> respuestas;

  factory Primerapregunta.fromJson(Map<String, dynamic> json) =>
      Primerapregunta(
        pregunta: json["pregunta"],
        respuestas: List<PrimerapreguntaRespuesta>.from(json["respuestas"]
            .map((x) => PrimerapreguntaRespuesta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pregunta": pregunta,
        "respuestas": List<dynamic>.from(respuestas.map((x) => x.toJson())),
      };
}

class PrimerapreguntaRespuesta {
  PrimerapreguntaRespuesta({
    required this.prueba,
    required this.solucion,
  });

  String prueba;
  String solucion;

  factory PrimerapreguntaRespuesta.fromJson(Map<String, dynamic> json) =>
      PrimerapreguntaRespuesta(
        prueba: json["prueba"],
        solucion: json["solucion"],
      );

  Map<String, dynamic> toJson() => {
        "prueba": prueba,
        "solucion": solucion,
      };
}

class Apregunta {
  Apregunta({
    required this.pregunta,
    required this.respuestas,
  });

  String pregunta;
  List<SegundapreguntaRespuesta> respuestas;

  factory Apregunta.fromJson(Map<String, dynamic> json) => Apregunta(
        pregunta: json["pregunta"],
        respuestas: List<SegundapreguntaRespuesta>.from(json["respuestas"]
            .map((x) => SegundapreguntaRespuesta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pregunta": pregunta,
        "respuestas": List<dynamic>.from(respuestas.map((x) => x.toJson())),
      };
}

class SegundapreguntaRespuesta {
  SegundapreguntaRespuesta({
    required this.antibiotico,
    required this.duracion,
    required this.intervalo,
    required this.cantidad,
    required this.dosis,
  });

  String antibiotico;
  String duracion;
  String intervalo;
  String cantidad;
  String dosis;

  factory SegundapreguntaRespuesta.fromJson(Map<String, dynamic> json) =>
      SegundapreguntaRespuesta(
        antibiotico: json["antibiotico"],
        duracion: json["duracion"],
        intervalo: json["intervalo"],
        cantidad: json["cantidad"],
        dosis: json["dosis"],
      );

  Map<String, dynamic> toJson() => {
        "antibiotico": antibiotico,
        "duracion": duracion,
        "intervalo": intervalo,
        "cantidad": cantidad,
        "dosis": dosis,
      };
}
