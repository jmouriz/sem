import 'package:flutter/material.dart';

class ActionModel {
  final IconData icon;
  final Function callback;

  ActionModel({
    required this.icon,
    required this.callback,
  });
}
