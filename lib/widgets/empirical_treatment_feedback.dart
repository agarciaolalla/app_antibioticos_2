import 'package:flutter/material.dart';

class EmpiricalTreatmentFeedback extends StatelessWidget {
  const EmpiricalTreatmentFeedback({
    Key? key,
    required this.treatmentFeedback,
  }) : super(key: key);

  //ToDo: Falta añadir la variable para filtrar por medicamentos seleccionados :)
  final List treatmentFeedback;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: treatmentFeedback.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            children: [
              Image(
                image: AssetImage(
                    '${treatmentFeedback[index]["antibiotico"]}.jpg'),
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text('${treatmentFeedback[index]["antibiotico"]}'),
                subtitle: Text('Dosis: ${treatmentFeedback[index]["dosis"]}'
                    '\n Vía: ${treatmentFeedback[index]["dosis"]}'
                    '\n Intervalo: ${treatmentFeedback[index]["intervalo"]}'
                    '\n ¿Activo?: ${treatmentFeedback[index]["activo"]}'
                    '\n Comentario: ${treatmentFeedback[index]["comentario"]}'),
              ),
            ],
          ),
        );
      },
    );
  }
}
