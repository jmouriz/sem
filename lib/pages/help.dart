import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:park/models/models.dart';
import 'package:park/controllers/controllers.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ToolbarController>().actions.value = [
      ActionModel(
        icon: Icons.search,
        callback: () {
          print('search');
        }
      ),
    ];

    return const Text(
      'Help is working',
      style: TextStyle(fontSize: 20),
    );
  }
}
