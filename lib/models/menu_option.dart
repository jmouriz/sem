import 'package:flutter/material.dart' show IconData, Widget;
import 'package:park/widgets/mutable_icon.dart';

class MenuOption {
  final String label;
  final String? title;
  final String? route;
  final IconData? icon;
  final Widget? target;
  final String? badge;
  final Map<String, MenuOption>? items;
  bool expanded;
  final bool visible;

  final MutableIconController _controller = MutableIconController();

  MenuOption({
    required this.label,
    this.title,
    this.route,
    this.icon,
    this.target,
    this.badge,
    this.items,
    this.expanded = false,
    this.visible = true,
  });

  get controller {
    return _controller;
  }
}