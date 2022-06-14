import 'package:app_antibioticos/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SecondCardViewTreatmentFeedback extends StatefulWidget {
  const SecondCardViewTreatmentFeedback(
      {Key? key, required this.treatmentFeedback})
      : super(key: key);

  final List treatmentFeedback;

  @override
  State<SecondCardViewTreatmentFeedback> createState() =>
      _SecondCardViewTreatmentFeedbackState();
}

class _SecondCardViewTreatmentFeedbackState
    extends State<SecondCardViewTreatmentFeedback> {
  List feedbackFinal = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.treatmentFeedback.length,
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
                getAssetName(widget.treatmentFeedback[index]["via"]),
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text(
                  '${widget.treatmentFeedback[index]["antibiotico"]}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                subtitle: Text(
                  '\nDosis: ${widget.treatmentFeedback[index]["dosis"]}'
                  '\nVía: ${widget.treatmentFeedback[index]["via"]}'
                  '\nIntervalo: ${widget.treatmentFeedback[index]["intervalo"]}'
                  '\n¿Actividad microbiológica?: ${widget.treatmentFeedback[index]["activo"]}'
                  '\nDias Seleccionados: ${widget.treatmentFeedback[index]["dias"]} ',
                  style: const TextStyle(color: Colors.black, fontSize: 17),
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
}
