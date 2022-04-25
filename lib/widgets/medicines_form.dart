import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:app_antibioticos/models/models.dart';

class MedicinesForm extends StatefulWidget {
  const MedicinesForm(
      {Key? key, required this.medicines, required this.numberMedicines})
      : super(key: key);

  final List<String> medicines;
  final List<String> numberMedicines;

  @override
  State<MedicinesForm> createState() => _MedicinesFormState();
}

class _MedicinesFormState extends State<MedicinesForm> {
  final _formKey = GlobalKey<FormState>();
  TableValues values = TableValues();
  List<TableValues> selectedValues = [];

  //Controladores de los TextField
  TextEditingController intervaleDosesController = TextEditingController();
  TextEditingController intervaleHoursController = TextEditingController();
  TextEditingController daysController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Variables que cambiaran los valores los desplegables
    String _valueMedicines = 'Seleccione un medicamento';
    String _valueDose = 'Seleccione una cantidad';

    //Generamos la tabla donde mostraremos los valores seleccionados
    Widget bodyData() => FittedBox(
          fit: BoxFit.contain,
          child: DataTable(
            onSelectAll: (b) {},
            columns: const [
              DataColumn(
                label: Center(
                  child: Text(
                    'Antibiótico',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              DataColumn(
                label: Center(
                  child: Text(
                    'Cantidad (mg)',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              DataColumn(
                label: Center(
                  child: Text(
                    'Intervalo',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              DataColumn(
                label: Center(
                  child: Text(
                    'Días',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              DataColumn(label: Center()),
            ],
            rows: selectedValues
                .map((medicine) => DataRow(
                      cells: [
                        DataCell(
                          Center(
                            child: Text(
                              medicine.medicine,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(
                              medicine.doses,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(
                              medicine.intervaleDoses +
                                  '/' +
                                  medicine.intervaleHours,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(
                              medicine.days,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        DataCell(Center(
                          child: IconButton(
                              onPressed: () => removeData(medicine),
                              icon: const Icon(Icons.delete)),
                        ))
                      ],
                    ))
                .toList(),
          ),
        );

// Antibiotico, Cantidad Mg, Intervalo (c/hora), Dias
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            //Desplegable de las medicinas que hay en la mochila
            DropdownButtonFormField(
              decoration:
                  const InputDecoration(labelText: 'Medicamentos disponibles'),
              value: _valueMedicines,
              icon: const Icon(Icons.arrow_drop_down),
              items: widget.medicines
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _valueMedicines = newValue!;
                  values.medicine = newValue;
                });
              },
              validator: (value) {
                if (value == 'Seleccione un medicamento') {
                  return 'Por favor, seleccione un medicamento';
                }
                return null;
              },
            ),
            //Espacio entre los campos
            const SizedBox(height: 20),
            //Desplegable de los mg disponibles del antibiotico.
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Cantidad (mg)'),
              value: _valueDose,
              icon: const Icon(Icons.arrow_drop_down),
              items: widget.numberMedicines
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _valueDose = newValue!;
                  values.doses = newValue;
                });
              },
              validator: (value) {
                if (value == 'Seleccione una cantidad') {
                  return 'Por favor, seleccione una cantidad';
                }
                return null;
              },
            ),
            //Espacio entre los campos
            const SizedBox(height: 20),
            //Campo de texto donde introduciremos la cantidad a consumir
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Intervalo (cantidad)',
                hintText: 'Intervalo (cantidad)',
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: intervaleDosesController,
              onSaved: (String? value) {
                values.intervaleDoses = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Introduca una cantidad";
                }
                return null;
              },
            ),
            //Espacio entre los campos
            const SizedBox(height: 20),
            //Campo de texto donde introduciremos cada cuantas horas se consume el antibiotico
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Intervalo (horas)',
                hintText: 'Intervalo (horas)',
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: intervaleHoursController,
              onSaved: (String? value) {
                values.intervaleHours = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Introduca la hora de intervalo";
                }
                return null;
              },
            ),
            //Espacio entre campos
            const SizedBox(height: 20),
            //Campo de texto donde introduciremos los dias que se tendra que tomar el antibiotico
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Dias',
                hintText: 'Dias',
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: daysController,
              onSaved: (String? value) {
                values.days = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Introduca la cantidad de dias";
                }
                return null;
              },
            ),
            //Boton de confirmar
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {
                  if (validate() == true) {
                    _formKey.currentState!.save();
                    addValues(
                      values.medicine,
                      values.doses,
                      values.intervaleDoses,
                      values.intervaleHours,
                      values.days,
                    );
                    clearForm();
                  }
                },
                child: const Text(
                  'Añadir',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            const SizedBox(height: 25),
            //Generamos el widget que generara la tabla de manera dinamica con los datos del formulario
            bodyData(),
          ],
        ),
      ),
    );
  }

  //Metodo para añadir los valores al list y pintarlos posteriormente en la tabla.
  void addValues(medicine, doses, intervaleDoses, intervaleHours, days) {
    setState(() {
      selectedValues.add(
          TableValues.c(medicine, doses, intervaleDoses, intervaleHours, days));
    });
  }

  //Metodo para limpiar el formulario una vez enviada la informacion (no aplica a los desplegables).
  clearForm() {
    intervaleDosesController.clear();
    intervaleHoursController.clear();
    daysController.clear();
  }

  //Metodo para validar el fomulario. En caso de introducir algo incorrecto saltara error (validator).
  bool validate() {
    var valid = _formKey.currentState!.validate();
    if (valid) {
      _formKey.currentState!.save();
    }
    return valid;
  }

  void removeData(TableValues value) {
    setState(() {
      selectedValues.remove(value);
    });
  }
}
