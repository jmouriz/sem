import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:park/controllers/controllers.dart';
import 'package:park/models/models.dart';

class Child2 extends StatelessWidget {
  const Child2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<ApplicationController>();
    final _count = (_controller.safeHeight / kMinInteractiveDimension).floor() - 1;

    Get.find<ToolbarController>().actions.value = [
      ActionModel(
        icon: Icons.search,
        callback: () {
          print(_count);
          _controller.searching.value = true;
          _controller.setState();
        }
      ),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortColumnIndex: 0,
        columns: const [
          DataColumn(label: Text('#')),
          DataColumn(label: Text('Comprador')),
          DataColumn(label: Text('Vendedor')),
          DataColumn(label: Text('Precio')),
          DataColumn(label: Text('')),
        ],
        rows: [
          for (var i = 0; i < _count; i++) DataRow(
            cells: [
              DataCell(Text('$i')),
              DataCell(Text('comprador$i@gmail.com')),
              DataCell(Text('vendedor$i@gmail.com')),
              DataCell(Text('${i * 10}')),
              const DataCell(Icon(Icons.folder)),
            ]
          ),
          const DataRow(
            cells: [
              DataCell(Text('')),
              DataCell(Text('')),
              DataCell(Text('')),
              DataCell(Text('1000')),
              DataCell(Text('')),
            ]
          ),
        ],
      ),
    );
  }
}
