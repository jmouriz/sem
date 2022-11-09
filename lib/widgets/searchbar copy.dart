import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:park/controllers/controllers.dart';
import 'package:park/widgets/widgets.dart';
//import 'package:park/models/models.dart';
//import 'package:park/providers/providers.dart';
//import 'package:park/widgets/widgets.dart';

class Searchbar extends StatefulWidget implements PreferredSizeWidget {
  Searchbar({
    Key? key, 
    required child,
    required parentKey,
  }) :
    _child = child,
    _key = parentKey,
    preferredSize = const Size.fromHeight(kToolbarHeight),
    super(key: key);

  final GlobalKey<ScaffoldState> _key;
  final String _child;

  final _applicationController = Get.put(ApplicationController());

  @override
  final Size preferredSize;

  /*
  void update(bool opened) {
    if (opened) {
      _controller.leadingController.animateToEnd();
    } else {
      _controller.leadingController.animateToStart();
    }
  }
  */

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  //Widget build(BuildContext context) {
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black
        ),
        /*
        icon: MutableIcon(
          duration: const Duration(milliseconds: 300),
          startIcon: Icons.menu,
          endIcon: Icons.close,
          startIconColor: Colors.white,
          endIconColor: Colors.white,
          controller: widget._controller.leadingController,
          initFrom: widget._key.currentState!.isDrawerOpen ? InitFrom.end : InitFrom.start,
        ),
        */
        onPressed: () {
          widget._applicationController.searching.value = false;
          widget._applicationController.setState();
        }
      ),
      title: const InputSearch(),
      centerTitle: false,
      actions: [
        AbsorbPointer(
          absorbing: false,
          child: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black
            ),
            /*
            icon: MutableIcons(
              icons: const [
                Icons.done,
                Icons.refresh,
                Icons.search,
                Icons.more_vert,
                Icons.add,
              ],
              color: Colors.grey,
              controller: widget._controller.trailingController,
            ),
            */
            onPressed: () {
              widget._applicationController.searching.value = false;
              widget._applicationController.setState();
            },
          ),
        )
      ]
    );
  }
}