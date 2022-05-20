const conexion1 = "http://172.18.23.127:50052"; //Servidor de Soler
//const conexion1 = "http://192.168.0.165:50052"; //Servidor de Soler (casa)
//const conexion1 = "http://172.18.22.79:50052"; //Servidor de Olalla
//const conexion1 = "http://192.168.1.11:50052"; //Servidor de Olalla (casa)
//const conexion1 = "http://172.18.22.79:50052";

// Id del caso clinico que se va a realizar
int idcaso = 2;
// Id de la pregunta de tratamiento (1 = inicial, 2 = final)
int idTreatmentQuestion = 1;
// Mochila con los medicamentos seleccionados al inicio del juego
List mochilaSeleccionada = [];
// Puntos del jugador
int points = 0;
