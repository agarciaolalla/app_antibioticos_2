import 'package:app_antibioticos/models/player_model.dart';

//const conexion1 = "http://172.18.23.127:50052"; //Servidor de Soler
//const conexion1 = "http://192.168.0.165:50052"; //Servidor de Soler (casa)
//const conexion1 = "http://172.18.22.79:50052"; //Servidor de Olalla
const conexion1 = "http://192.168.1.11:50052"; //Servidor de Olalla (casa)
//const conexion1 = "http://172.18.22.79:50052";
//const conexion1 = "http://172.30.67.51:50052"; //instituto ITACA

//const conexion1 = "http://1.44.4.78:50052";

// Id del caso clinico que se va a realizar
int idcaso = 1;
// Id de la pregunta de tratamiento (1 = inicial, 2 = final)
int idTreatmentQuestion = 1;
// Mochila con los medicamentos seleccionados al inicio del juego
List mochilaSeleccionada = [];

// Puntos del jugador
int points = 0;
// Vida del jugador
double vidaJugador = 1.0;

//Informacion inicial para mostrar en las demas screens
String initialInfo = "";
//Feedback Diagnostic question para mostrar en las demas screens
String diagnosticFeedback = "";
//Feedback first treatment para mostrar en las demas screens
List firstTreatmentFeedback = [];
//Feedback second treatment para mostrar en las demas screens
List secondTreatmentFeedback = [];

//Player actual
Player player = Player(
  name: "",
  surname: "",
  points: "0",
  challenges: "0",
  medicines: "0",
  life: "0.0",
);
