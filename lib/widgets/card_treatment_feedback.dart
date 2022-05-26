import 'package:app_antibioticos/theme/app_theme.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';
import 'package:flutter/material.dart';

class CardViewTreatmentFeedback extends StatelessWidget {
  const CardViewTreatmentFeedback({
    Key? key,
    required this.treatmentFeedback,
  }) : super(key: key);

  final List treatmentFeedback;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: treatmentFeedback.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          shadowColor: AppTheme.primary.withOpacity(0.5),
          elevation: 30,
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset(
                getAssetName(treatmentFeedback[index]["via"]),
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text(
                  '${treatmentFeedback[index]["antibiotico"]}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '\nDosis: ${treatmentFeedback[index]["dosis"]}'
                  '\nVía: ${treatmentFeedback[index]["via"]}'
                  '\nIntervalo: ${treatmentFeedback[index]["intervalo"]}'
                  '\n¿Activo?: ${treatmentFeedback[index]["activo"]}'
                  '\nDosis utilizadas: ${treatmentFeedback[index]["consumo"]}'
                  '\n\n${getCardComment(index)}',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String getAssetName(String via) {
    if (via == 'Vía Oral') {
      return 'assets/Via_oral.jpg';
    } else {
      return 'assets/Via_intravenosa.jpg';
    }
  }

  //Metodo para que elija un comentario u otro segun la pregunta de tratamiento (1 = empirica, 2 = dirigida)
  String getCardComment(int index) {
    if (idTreatmentQuestion == 1) {
      return treatmentFeedback[index]["comentario"];
    } else if (idTreatmentQuestion == 2) {
      return treatmentFeedback[index]["lastfeedback"];
    } else {
      return 'error getting the comment';
    }
  }
}
