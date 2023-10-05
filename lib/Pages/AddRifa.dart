import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';

class AddRifa extends StatefulWidget {
  const AddRifa({super.key});

  @override
  State<AddRifa> createState() => _AddRifaState();
}

class _AddRifaState extends State<AddRifa> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  TextEditingController numeroBoletosController = TextEditingController();
  TextEditingController precioBoletoController = TextEditingController();
  TextEditingController _dateI = TextEditingController();
  TextEditingController _dateF = TextEditingController();
  DateTime? fechaInicio;
  DateTime? fechaTermino;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Añadir Rifa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            //Nombre
            TextField(
              decoration: InputDecoration(
                  labelText: "Nombre",
                  hintText: "Ingrese el nombre de la rifa"
              ),
            ),

            //Campo para la descripcion
            TextField(
              decoration: InputDecoration(
                  labelText: "Descripcion",
                  hintText: "Ingrese descripcion de la rifa"
              ),
            ),

            //Campo para el numero de boletos

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Número de boletos",
                  hintText: "Ingrese el numero de boletos para la rifa"
              ),
            ),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Precio del boleto",
                  hintText: "Ingrese el precio de boleto para la rifa"
              ),
            ),

            TextField(
              controller: _dateI,
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_month_rounded),
                labelText: "Fecha de inicio de la rifa Rifa",),
              onTap: () async {
                DateTime? pickeddateI = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100));

                if(pickeddateI != null){
                  _dateI.text = DateFormat.yMMMMd(Intl.getCurrentLocale()).format(pickeddateI);
                }
              },
            ),
            TextField(
              controller: _dateF,
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_month_rounded),
                labelText: "Fecha de Termino de la rifa Rifa",),
              onTap: () async {
                DateTime? pickeddateT = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100));

                if(pickeddateT != null){
                  _dateF.text = DateFormat.yMMMMd(Intl.getCurrentLocale()).format(pickeddateT);
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){

          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: 'Felicidades Rifa Añadida',
          );
        },
      ),
    );
  }
}