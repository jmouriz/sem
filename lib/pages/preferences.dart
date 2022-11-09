import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:get/get.dart';
import 'package:park/controllers/application.dart';

class Preferences extends StatefulWidget {
  const Preferences({Key? key}) : super(key: key);

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  //bool dark = Get.isDarkMode;
  bool notifications = false;

  final _controller = Get.put(ApplicationController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(_controller.dark
            ? 'Usar tema claro'
            : 'Usar tema oscuro'
          ),
          trailing: Icon(_controller.dark
            ? Icons.light_mode
            : Icons.dark_mode,
            color: _controller.dark
              ? Colors.white
              : Colors.black,
          ),
          onTap: () {
            _controller.dark = !_controller.dark;
            setState(() {});
          },
        ),
        ListTile(
          title: const Text('Color del tema'),
          trailing: CircleAvatar(
            //backgroundColor: Colors.blue,
            backgroundColor: Theme.of(context).primaryColor,
            radius: 12,
          ),
          onTap: (() {
            showDialog(
              context: context, 
              builder: (_) {
                return const AlertDialog(
                  contentPadding: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24.0))
                  ),
                  title: Text('Color del tema'),
                  content: MaterialColorPicker(
                    allowShades: false,
                    colors: fullMaterialColors,
                  ),
                );
              }
            );
          }),
        ),
        ListTile(
          title: Text(notifications 
            ? 'Desactivar notificaciones'
            : 'Activar notificaciones'
          ),
          trailing: Icon(notifications
            ? Icons.notifications_off
            : Icons.notifications_active,
            color: Colors.black,
          ),
          onTap: (() {
            setState(() {
              notifications = !notifications;
            });
          }),
        ),
      ],
    );
  }
}
