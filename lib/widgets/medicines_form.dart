import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:app_antibioticos/models/models.dart';

class MedicinesForm extends StatefulWidget {
  const MedicinesForm({Key? key, required this.medicines}) : super(key: key);

  final List medicines;

  @override
  State<MedicinesForm> createState() => _MedicinesFormState();
}

class _MedicinesFormState extends State<MedicinesForm> {
  final _formKey = GlobalKey<FormState>();
  TableValues values = TableValues();
  List<TableValues> selectedValues = [];

  //Listado con los nombres de los antibioticos (ButtonDropDown)
  List<String> medicineNames = [];

  //Controladores de los TextField
  TextEditingController intervaleDosesController = TextEditingController();
  TextEditingController intervaleHoursController = TextEditingController();
  TextEditingController daysController = TextEditingController();

  //Variable que almacenaran lo introducido en el formulario (dropdown button no tiene controller)
  String _valueMedicines = 'Seleccione un medicamento';

  //Variable donde almacenaremos los cambios realizados finalmente
  List medicinesUsed = [];

  @override
  Widget build(BuildContext context) {
    //Rellenamos el array para mostrar los nombres de los medicamentos
    if (medicineNames.isEmpty) {
      fillMedicineNames();
      print(widget.medicines);
      print(medicineNames);
    }

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
              items:
                  medicineNames.map<DropdownMenuItem<String>>((String value) {
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
              //Comprobamos que el numero de medicinas sea valido
              validator: (value) {
                int disponible = getNumberMedicines(_valueMedicines);
                if (value == null || value.isEmpty) {
                  return "Introduca una cantidad";
                } else if (int.parse(intervaleDosesController.text) >
                    disponible) {
                  return "No hay suficientes medicamentos en la mochila";
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
              //Comprobamos si se ha introducido unos valores correctos
              validator: (value) {
                int disponible = getNumberMedicines(_valueMedicines);
                int usado = (24 /
                        int.parse(intervaleHoursController.text) *
                        (int.parse(intervaleDosesController.text) *
                            int.parse(daysController.text)))
                    .toInt();
                if (value == null || value.isEmpty) {
                  return "Introduca la cantidad de dias";
                } else if (usado > disponible) {
                  return "No hay suficientes medicamentos en la mochila";
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
            //Boton de confirmar
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  setBackpack(medicinesUsed);
                },
                child: const Text(
                  'Confirmar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //Metodo para añadir los valores al list y pintarlos posteriormente en la tabla.
  void addValues(medicine, intervaleDoses, intervaleHours, days) {
    int usedNumber = (24 /
            int.parse(intervaleHours) *
            (int.parse(intervaleDoses) * int.parse(days)))
        .toInt();

    //Añadimos los datos del antibiotico al array de usados
    medicinesUsed.add({"nombre": medicine, "numero": usedNumber.toString()});

    setState(() {
      selectedValues
          .add(TableValues.c(medicine, intervaleDoses, intervaleHours, days));
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

  //Metodo para eliminar un dato de la datatable
  void removeData(TableValues value) {
    int usedNumber = (24 /
            int.parse(value.intervaleHours) *
            (int.parse(value.intervaleDoses) * int.parse(value.days)))
        .toInt();

    for (int i = 0; i < medicinesUsed.length; i++) {
      if (medicinesUsed[i]["nombre"] == value.medicine &&
          medicinesUsed[i]["numero"] == usedNumber.toString()) {
        medicinesUsed.remove(i);
      }
    }

    setState(() {
      selectedValues.remove(value);
    });
  }

  //Metodo para rellenar el array con los nombres (dropdown button)
  void fillMedicineNames() {
    medicineNames.add('Seleccione un medicamento');
    for (int i = 0; i < widget.medicines.length; i++) {
      int number = int.parse(widget.medicines[i]["numero"]);
      if (number > 0) {
        medicineNames.add(widget.medicines[i]["nombre"]);
      }
    }
  }

  //Metodo para obtener el numero de medicinas disponible
  int getNumberMedicines(String medicineName) {
    int number = 0;
    for (int i = 0; i < widget.medicines.length; i++) {
      if (widget.medicines[i]['nombre'] == medicineName) {
        number = int.parse(widget.medicines[i]['numero']);
      }
    }
    return number;
  }

  //Metodo para quitar cantidad de antibioticos de la mochila al usarlos
  void setBackpack(List medicinesUsed) {
    for (int i = 0; i < widget.medicines.length; i++) {
      for (int j = 0; i < medicinesUsed.length; j++) {
        if (widget.medicines[i]["nombre"] == medicinesUsed[j]["nombre"]) {
          int used = int.parse(medicinesUsed[j]["numero"]);
          int total = int.parse(widget.medicines[i]["numero"]);
          widget.medicines[i]["numero"] = (total - used).toString();
        }
      }
    }
    print(widget.medicines);
  }
}
