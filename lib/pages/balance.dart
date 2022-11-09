import 'package:flutter/material.dart';

class Balance extends StatelessWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Disponible para estacionar'),
        const Text(
          '100',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.w900,
            color: Colors.teal,
          ),
        ),
        ElevatedButton(
          child: const Text('Cargar'),
          onPressed: () {},
        ),
      ],
    );
  }
}
