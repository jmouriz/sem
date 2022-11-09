/// Author: Juan Manuel Mouriz
/// website: tecnologica.com.ar
/// Version: 1.1.2
/// Null-Safety: checked!
/// Prefer Const: checked!
library mutable_icons;

import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Class [MutableIcons]:
///
/// [icons]: The [List<IconData>] that will contains the icons that be
/// visible.
///
/// [controller]: MutableIcon controller.
///
/// [color]: The color to be used for the icon.
///
/// [duration]: The duration for which the animation runs.
///
/// [size]: The size of the icon that are to be shown.
///
/// [clockwise]: If the animation runs in the clockwise or anticlockwise
/// direction.
///
/// Used to set initial state. Indicates whether to init from from the icon
/// index. Default is 0 (first icon).
class MutableIcons extends StatefulWidget {
  /// Creates a [MutableIcons] widget.
  ///
  /// [icons]: The [List<IconData>] that will contains the icons that be
  /// visible.
  ///
  /// [controller]: MutableIcon controller.
  ///
  /// [color]: The color to be used for the icon.
  ///
  /// [duration]: The duration for which the animation runs.
  ///
  /// [size]: The size of the icon that are to be shown.
  ///
  /// [clockwise]: If the animation runs in the clockwise or anticlockwise
  /// direction.
  ///
  /// Used to set initial state. Indicates whether to init from from the icon
  /// index. Default is 0 (first icon).
  const MutableIcons({
    Key? key,

    /// The [List<IconData>] that will contains the icons that be visible.
    required this.icons,

    /// MutableIcon controller.
    required this.controller,

    /// The color to be used for the icon.
    this.color,

    /// The duration for which the animation runs.
    this.duration = const Duration(milliseconds: 300),

    /// The size of the icon that are to be shown.
    this.size = 24.0,

    /// If the animation runs in the clockwise or anticlockwise direction.
    this.clockwise = false,

    /// Used to set initial state. Indicates whether to init from from the 
    /// icon index. Default is 0 (first icon).
    this.initFrom = 0,
  }) : super(key: key);

  final List<IconData> icons;
  final MutableIconsController controller;
  final Color? color;
  final Duration duration;
  final double size;
  final bool clockwise;
  final int initFrom;

  @override
  _MutableIconsState createState() => _MutableIconsState();
}

class _MutableIconsState extends State<MutableIcons>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  IconData _first = Icons.error;
  IconData _second= Icons.error_outline;
  int _current = 0;

  @override
  void initState() {
    _current = widget.initFrom;
    _first = widget.icons[_current];
    _second = widget.icons[_current];
    
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    _controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    initControllerFunctions();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  initControllerFunctions() {
    widget.controller.next = () {
      _current++;
      if (_current == widget.icons.length) {
        _current = 0;
      }
      return widget.controller.animateTo(_current);
    };

    widget.controller.animateTo = (int index) {
      if (index < widget.icons.length && mounted) {
        _first = widget.icons[_current];
        _second = widget.icons[index];
        _current = index;
        _controller.reset();
        _controller.forward();
        return true;
      }
      return false;
    };

    widget.controller.isIndex = (int index) => widget.initFrom < index;
  }

  @override
  Widget build(BuildContext context) {
    double start = 1.0 - _controller.value;
    double end = _controller.value;
    double startOpacity = start;
    double endOpacity = end;
    double startAngle = math.pi / 180 * (180 * end);
    double endAngle = math.pi / 180 * (180 * start);

    Widget first() {
      final icon = Icon(
        _first,
        size: widget.size,
        color: widget.color ?? Theme.of(context).primaryColor,
      );
      return Transform.rotate(
          angle: widget.clockwise ? -startAngle : startAngle,
          child: Opacity(
            opacity: startOpacity,
            child: icon,
          ));
    }

    Widget second() {
      final icon = Icon(
        _second,
        size: widget.size,
        color: widget.color ?? Theme.of(context).primaryColor,
      );
      return Transform.rotate(
        angle: widget.clockwise ? -endAngle : endAngle,
        child: Opacity(
          opacity: endOpacity,
          child: icon
        ),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        first(),
        second(),
      ],
    );
  }
}

/// This is a controller for the animations.
class MutableIconsController {
  /// This is the function to run the animation to the specified icon.
  bool Function(int) animateTo = (int index) => false;

  /// This is the function to run the animation to next icon of the list.
  bool Function() next = () => false;

  /// This is a simple getter to know the icon index shown.
  bool Function(int) isIndex = (int index) => false;
}
