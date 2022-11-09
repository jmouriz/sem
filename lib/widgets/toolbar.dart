import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:park/controllers/controllers.dart';
import 'package:park/models/models.dart';
import 'package:park/providers/providers.dart';
import 'package:park/widgets/widgets.dart';

class Toolbar extends StatefulWidget implements PreferredSizeWidget {
  Toolbar({
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

  final _controller = Get.put(ToolbarController());

  @override
  final Size preferredSize;

  void update(bool opened) {
    if (opened) {
      _controller.leadingController.animateToEnd();
    } else {
      _controller.leadingController.animateToStart();
    }
  }

  @override
  State<Toolbar> createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  @override
  //Widget build(BuildContext context) {
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: MutableIcon(
          duration: const Duration(milliseconds: 300),
          startIcon: Icons.menu,
          endIcon: Icons.close,
          startIconColor: Theme.of(context).primaryColor.computeLuminance() > .5 ? Colors.black : Colors.white,
          endIconColor: Theme.of(context).primaryColor.computeLuminance() > .5 ? Colors.black : Colors.white,
          controller: widget._controller.leadingController,
          initFrom: widget._key.currentState!.isDrawerOpen ? InitFrom.end : InitFrom.start,
        ),
        onPressed: () {
          widget._key.currentState!.openDrawer();
        }
      ),
      title: Text(Menu.get(widget._child).title ?? Menu.get(widget._child).label),
      /*
      title: TextFormField(
        autofocus: true,
        initialValue: '',
        decoration: const InputDecoration(
          hintText: 'usuario@dominio.com',
          labelText: 'Correo electrónico',
          helperText: 'Ingresa tu dirección de correo electrónico',
        ),
      ),
      */
      centerTitle: true,
      actions: List.generate(widget._controller.actions.length, (index) {
        ActionModel action = widget._controller.actions[index];
        return Padding(
          padding: const EdgeInsets.only(right: 6.0),
          child: AbsorbPointer(
            absorbing: false,
            child: IconButton(
              icon: Icon(action.icon),
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
                //widget._controller.trailingController.next();
                action.callback();
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}