//import 'package:app_antibioticos/bd/mongodb.dart';
//import 'package:app_antibioticos/models/models.dart';
//import 'package:app_antibioticos/screens/first_question/edit_answer.dart';
//import 'package:app_antibioticos/widgets/first_list_answer.dart';
//import 'package:app_antibioticos/screens/screens.dart';
//import 'package:flutter/material.dart';
//
//class FirstQuestion extends StatefulWidget {
//  @override
//  _FirstQuestionState createState() => _FirstQuestionState();
//}
//
//class _FirstQuestionState extends State<FirstQuestion> {
//  @override
//  Widget build(BuildContext context) {
//    return FutureBuilder(
//      future: MongoDB.getFirstAnswer(),
//      builder: (BuildContext context, AsyncSnapshot snapshot) {
//        if (snapshot.connectionState == ConnectionState.waiting) {
//          //en caso de estar conectando con la bdd entrara en este if
//          return Container(
//              color: Colors.white,
//              child: const LinearProgressIndicator(
//                backgroundColor: Colors.black,
//              ));
//        } else if (snapshot.hasError) {
//          //si ha ocurrido un error en la conexion mostrara el siguiente mensaje
//          return Container(
//              color: Colors.white,
//              child: Center(
//                  child: Text(
//                "Lo sentimos, hubo un error. Inténtelo de nuevo.",
//                style: Theme.of(context).textTheme.headline6,
//              )));
//        } else {
//          //Si se ha conectado correctamente entrara aqui
//          return Scaffold(
//            appBar: AppBar(title: const Text("¿Qué tratamientos elegirías?")),
//            body: ListView.builder(
//              itemBuilder: (context, index) {
//                return Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: FirstListAnswer(
//                        firstAnswer: FirstAnswer.fromMap(snapshot.data[index]),
//                        onTapDelete: () async {
//                          _eliminarAnswer(
//                              FirstAnswer.fromMap(snapshot.data[index]));
//                        },
//                        onTapEdit: () async {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (BuildContext context) {
//                                    return EditFirstAnswer();
//                                  },
//                                  settings: RouteSettings(
//                                    arguments: FirstAnswer.fromMap(
//                                        snapshot.data[index]),
//                                  ))).then((value) => setState(() {}));
//                        }));
//              },
//              itemCount: snapshot.data.length,
//            ),
//            floatingActionButton: FloatingActionButton(
//              onPressed: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (BuildContext context) {
//                  return EditFirstAnswer();
//                })).then((value) => setState(() {}));
//              },
//              child: const Icon(Icons.add),
//            ),
//          );
//        }
//      },
//    );
//  }
//
//  _eliminarAnswer(FirstAnswer firstAnswer) async {
//    await MongoDB.eliminar(firstAnswer);
//    setState(() {});
//  }
//}
//