import 'package:app_antibioticos/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:app_antibioticos/models/models.dart';
import 'package:app_antibioticos/utilidades/constantes.dart';

class MedicinesForm extends StatefulWidget {
  const MedicinesForm({Key? key, required this.idPregunta}) : super(key: key);

  final int idPregunta;

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
                if (value == null || value.isEmpty) {
                  return "Introduca la cantidad de dias";
                } else {
                  int disponible = getNumberMedicines(_valueMedicines);
                  int usado = int.parse(daysController.text).toInt();
                  if (usado > disponible) {
                    return "No hay suficientes medicamentos en la mochila";
                  }
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

                  //Navigator.push(
                  //  context,
                  //  MaterialPageRoute(
                  //    builder: (context) => TreatmentFeedback(),
                  //  ),
                  //);
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
  void addValues(medicine, days) {
    //Añadimos los datos del antibiotico al array de usados
    medicinesUsed.add({"antibiotico": medicine, "dias": days});

    setState(() {
      selectedValues.add(TableValues.c(medicine, days));
    });
  }

  //Metodo para limpiar el formulario una vez enviada la informacion (no aplica a los desplegables).
  clearForm() {
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
    for (int i = 0; i < medicinesUsed.length; i++) {
      if (medicinesUsed[i]["antibiotico"] == value.medicine &&
          medicinesUsed[i]["dias"] == value.days) {
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
    for (int i = 0; i < mochilaSeleccionada.length; i++) {
      medicineNames.add(
          'nombre: ${mochilaSeleccionada[i]["antibiotico"] + " - " + mochilaSeleccionada[i]["dosis"] + " - " + mochilaSeleccionada[i]["intervalo"]}');
    }
  }

  //Metodo para obtener el numero de medicinas disponible
  int getNumberMedicines(String medicineName) {
    int number = 0;
    for (int i = 0; i < mochilaSeleccionada.length; i++) {
      if (mochilaSeleccionada[i]['antibiotico'] == medicineName) {
        number = int.parse(mochilaSeleccionada[i]['numpastillas']);
      }
    }
    return number;
  }

  //Metodo para quitar cantidad de antibioticos de la mochila al usarlos
  void setBackpack(List medicinesUsed) {
    for (int i = 0; i < mochilaSeleccionada.length; i++) {
      for (int j = 0; j < medicinesUsed.length; j++) {
        if (mochilaSeleccionada[i]["antibiotico"] ==
            medicinesUsed[j]["antibiotico"]) {
          int used = int.parse(medicinesUsed[j]["numpastillas"]);
          int total = int.parse(mochilaSeleccionada[i]["numpastillas"]);
          mochilaSeleccionada[i]["numpastillas"] = (total - used).toString();
        }
      }
    }
  }
}
