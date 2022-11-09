import 'package:flutter/material.dart';
import 'package:get/get.dart';

// https://youtube.com/shorts/XMg_uoB2Q8k
class ApplicationController extends GetxController {
  var searching = false.obs;

  //var actions = [];

  ///
  Function setState = () {};

  ///
  Function navigate = (String route) {};

  ///
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  ///
  var busy = false.obs;

  ///
  final _dark = Get.isDarkMode.obs;

  bool get dark => _dark.value;

  set dark(bool dark) {
    if (_dark.value != dark) {
      _dark.value = dark;
      Get.changeTheme(dark
        ? ThemeData.dark()
        : ThemeData.light()
      );
      setState();
    }
  }

  ///
  double get safeHeight {
    final _context = key.currentContext!;
    final _media = MediaQuery.of(_context);
    final _height = _media.size.height - _media.padding.top - _media.padding.bottom;
    const _padding = 8.0; // XXX
    return _height - 2.0 * _padding - kToolbarHeight;
  }
}
