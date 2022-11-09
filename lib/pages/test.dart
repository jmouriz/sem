import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({ Key? key }) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<State> _key = GlobalKey<State>();

    return Stack(
      children: [
        Container(
          width: 120,
          height: 120,
          color: Colors.red,
          child: const FlutterLogo()
        ),
        const Text('Test is working'),
        const Text('Test is working'),
        ElevatedButton(
          onPressed: () {

showGeneralDialog(
  context: context,
  barrierColor: Colors.black12.withOpacity(0.6), // Background color
  barrierDismissible: true,
  barrierLabel: 'Dialog',
  transitionDuration: const Duration(milliseconds: 400),
  pageBuilder: (_, __, ___) {
    return Container(
      color: Colors.yellow,
      child: Stack(
        children: [
          SafeArea(
            key: _key,
            child: Container(
              width: 120,
              height: 120,
              color: Colors.black,
              child: ElevatedButton(
                child: const Text('Probar'),
                onPressed: () {
    final media = MediaQuery.of(_key.currentContext!);
    double height = media.size.height - media.padding.top - media.padding.bottom - kToolbarHeight - 2.0 * 8.0;
    //print(media.size.height);
    print(media.padding.top);
    print(media.padding.bottom);
                }
              )
            ),
          )
        ],
      )
    );
  },
);




          },
          child: const Text('Probar')
        )
      ]
    );
  }
}
