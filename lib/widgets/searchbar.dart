import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:park/controllers/controllers.dart';
//import 'package:park/models/models.dart';
//import 'package:park/providers/providers.dart';
import 'package:park/widgets/widgets.dart';

class Searchbar extends StatefulWidget implements PreferredSizeWidget {
  Searchbar({
    Key? key, 
    required child,
    required parentKey,
    count,
  }) :
    _child = child,
    _key = parentKey,
    preferredSize = Size.fromHeight((count ?? 1) * kToolbarHeight),
    super(key: key);

  final GlobalKey<ScaffoldState> _key;
  final String _child;

  final _applicationController = Get.put(ApplicationController());
  //final _searchbarController = Get.put(SearchbarController());

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
  Widget build(BuildContext context) {
  //PreferredSizeWidget build(BuildContext context) {

    return Column(
      children: [
        AppBar(
          key: const ValueKey<String>('searchbar'),
          elevation: 2,
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
            SearchFieldMenuButton(),
            /*
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black
              ),
              onPressed: () {},
            ),
            */
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.black
                ),
                onPressed: () {
                  widget._applicationController.searching.value = false;
                  widget._applicationController.setState();
                },
              ),
            )
          ]
        ),
      ],
    );
  }
}