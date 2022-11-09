import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        autofocus: true,
        initialValue: '',
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: 'Buscar...',
        ),
      ),
    );
  }
}
