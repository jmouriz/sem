import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:park/controllers/controllers.dart';
import 'package:park/models/models.dart';

class SearchFieldMenuButton extends StatelessWidget {
  final _searchbarController = Get.put(SearchbarController());

  SearchFieldMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        position: PopupMenuPosition.under,
        tooltip: 'Ver opciones',
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        icon: const Icon(
          Icons.more_vert,
          color: Colors.black,
        ),
        itemBuilder: (_) {
          return [
            _popupMenuItem(0, Icons.done, 'Correo electrónico'),
            _popupMenuItem(0, Icons.add, 'Nueva condición'),
          ];
        });
  }

  PopupMenuItem<int> _popupMenuItem(int value, IconData icon, String label) {
    return PopupMenuItem(
      value: value,
      onTap: () {
        _searchbarController.conditions.add(
          SearchCondition(name: 'Fecha')
        );
        Get.find<ApplicationController>().setState();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(label),
            ),
          ),
        ],
      ),
    );
  }
}
