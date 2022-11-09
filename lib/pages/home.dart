import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:park/providers/home.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.spaceEvenly,
        children: [
          //for (var item = 0; item < HomeProvider.items.length; item++)
          for (var i = 0; i < 9; i++)
            SizedBox(
              width: 98,
              height: 98,
              child: Card(
                elevation: 5,
                color: _theme.primaryColor, // Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Badge(
                        child: const Icon(
                          Icons.question_mark_rounded,
                          color: Colors.white,
                        ),
                        badgeContent: const Text(
                          '3',
                          style: TextStyle(color: Colors.white),
                        ),
                        position: BadgePosition.bottomEnd(),
                        showBadge: i == 4,
                      ),
                      const Text(
                        'Hola',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ),
              ),
            )
        ]);
  }
}
