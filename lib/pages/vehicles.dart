import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:get/get.dart';

import 'package:park/controllers/controllers.dart';
import 'package:park/models/models.dart';

class Vehicles extends StatelessWidget {
  const Vehicles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ToolbarController>().actions.value = [
      ActionModel(
        icon: Icons.add,
        callback: () {
          Get.find<ApplicationController>().navigate('home');
        }
      ),
    ];

    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(
        width: double.infinity,
        height: 6,
      ),
      itemBuilder: (_, index) => Material(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: index == 2
          ? Colors.green.shade200
          : index == 0
          ? Colors.red.shade200
          : index == 3 
          ? Colors.teal.shade200
          : null,
        child: ListTile(
          contentPadding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
          leading: Badge(
            child: Icon(index == 1
              ? Icons.motorcycle
              : Icons.directions_car,
              color: Colors.black
            ),
            position: BadgePosition.bottomEnd(),
            showBadge: index == 0 || index == 2,
            badgeColor: index == 0
              ? Colors.red
              : Colors.green,
          ),
          title: Text(index == 1
            ? 'EFL537'
            : '220IXW'
          ),
          subtitle: Text(index == 2
            ? 'Estacionado hace 3 minutos'
            : index == 0
            ? '2 infracciones pendientes'
            : index == 3
            ? 'Promoción hasta el 23/11/2022 a las 13:15'
            : 'No estacionado',
          ),
          trailing: index != 0 && index != 2 && index != 3 ? IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.black
            ),
            onPressed: () {},
          ) : null,
          onTap: () {},
        ),
      )
    );
    
    /*
    return Column(
      children: List.generate(4, (index) => ListTile(
        contentPadding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
        leading: Badge(
          child: const Icon(
            Icons.directions_car,
            color: Colors.black
          ),
          showBadge: index == 2,
          badgeColor: Colors.green,
        ),
        title: const Text('EFL537'),
        subtitle: Text(index == 2
          ? 'Estacionado hace 3 minutos'
          : 'No estacionado'
        ),
        trailing: index != 2 ? IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.black
          ),
          onPressed: () {},
        ) : null,
        onTap: () {},
      ))
    );
    */
  }
}
