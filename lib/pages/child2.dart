import 'dart:math';

//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:park/controllers/controllers.dart';
import 'package:park/models/models.dart';

class Child2 extends StatelessWidget {
  const Child2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<ApplicationController>();
    final _count = (_controller.safeHeight / kMinInteractiveDimension).floor() - 2;
    final DataTableSource _data = DataSource();

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

    return Theme(
      data: Theme.of(context).copyWith(
        cardTheme: const CardTheme(
          elevation: 0,
        )
      ),
      child: PaginatedDataTable(
        source: _data,
        sortColumnIndex: 0,
        rowsPerPage: _count,
        showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text('#')),
          DataColumn(label: Text('Comprador')),
          DataColumn(label: Text('Vendedor')),
          DataColumn(label: Text('Precio')),
          DataColumn(label: Text('')),
        ],
      ),
    );
  }
}

class DataSource extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
    1000,
    (index) => {
      'id': index,
      'user': 'user$index@domain.com',
      'vendor': 'vendor$index@domain.com',
      'price': Random().nextDouble() * 500,
    }
  );

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(
      cells: [
        DataCell(Text(_data[index]['id'].toString())),
        DataCell(Text(_data[index]['user'])),
        DataCell(Text(_data[index]['vendor'])),
        DataCell(Text(_data[index]['price'].toStringAsFixed(2))),
        const DataCell(Icon(Icons.delete)),
      ]
    );
  }
}
