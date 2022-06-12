import 'package:app_antibioticos/models/player_model.dart';

//const conexion1 = "http://172.18.23.127:50052"; //Servidor de Soler
//const conexion1 = "http://192.168.0.165:50052"; //Servidor de Soler (casa)
//const conexion1 = "http://172.18.22.79:50052"; //Servidor de Olalla
//const conexion1 = "http://192.168.1.11:50052"; //Servidor de Olalla (casa)
//const conexion1 = "http://172.18.22.79:50052";
//const conexion1 = "http://172.30.67.51:50052"; //instituto ITACA

//const conexion1 = "//1.44.4.78:50052";
const conexion1 = "//localhost:50052";

// Id del caso clinico que se va a realizar
int idcaso = 1;
// Mochila con los medicamentos seleccionados al inicio del juego
List mochilaSeleccionada = [];

//Máxima puntuación
int maxPoints = 32;
// Puntos del jugador totales
double pointsBar = 0.0;
int points = 0;
//Puntos obtenidos en un caso
int pointsPerCase = 0;
// Vida del jugador
double vidaJugador = 1.0;
//vida perdida en cada caso
double vidaCaso = 0.0;
//Informacion inicial para mostrar en las demas screens
String initialInfo = "";
//Feedback Diagnostic question para mostrar en las demas screens
String diagnosticFeedback = "";
//Feedback first treatment para mostrar en las demas screens
List firstTreatmentFeedback = [];
//Feedback second treatment para mostrar en las demas screens
List secondTreatmentFeedback = [];
//Vida perdida de la segunda y tercera pregunta maximo 20% en cada caso.
int lifeLost = 0;
//Player actual
Player player = Player(
  name: "",
  surname: "",
  points: "0",
  challenges: "0",
  medicines: "0",
  life: "0.0",
);
