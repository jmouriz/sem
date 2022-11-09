import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:park/controllers/controllers.dart';
import 'package:park/models/models.dart';

class Child1 extends StatelessWidget {
  const Child1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ToolbarController>().actions.value = [
      ActionModel(
        icon: Icons.chevron_right,
        callback: () {
          print('submit');
          Get.snackbar(
            'El correo electrónico ya está registrado',
            'Prueba con otra dirección',
            colorText: Colors.white,
            backgroundColor: Colors.red,
            boxShadows: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 3
              )
            ],
          );
        }
      ),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          autofocus: true,
          initialValue: '',
          decoration: const InputDecoration(
            hintText: 'usuario@dominio.com',
            labelText: 'Correo electrónico',
            helperText: 'Ingresa tu dirección de correo electrónico',
          ),
        ),
      ],
    );
  }
}