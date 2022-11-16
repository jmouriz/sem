import 'package:flutter/material.dart';
import 'package:park/providers/providers.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required String child,
    required ScrollController scroll,
    required double padding,
  }) :
    _child = child,
    _scroll = scroll,
    _padding = padding,
    super(key: key);

  final ScrollController _scroll;
  final String _child;
  final double _padding;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween(
            begin: Offset(animation.isCompleted ? -1.0 : 1.0, 0.0),
            end: Offset.zero
          ).animate(animation),
          child: child
        );
      },
      child: SafeArea(
        key: ValueKey<String>('container/$_child'),
        top: false,
        child: Container(
          alignment: Alignment.topCenter,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            margin: EdgeInsets.all(_padding),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(_padding),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: _scroll,
                  child: Menu.get(_child).target,
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}