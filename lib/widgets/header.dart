import 'package:flutter/material.dart';
import 'package:park/widgets/widgets.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Sidenav widget;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Container(
      height: widget.appBar.preferredSize.height + 2 * widget.padding,
      decoration: BoxDecoration(
        color: _theme.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(2, 5)
          )
        ]
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(widget.padding),
            child: Icon(
              Icons.account_circle_rounded,
              color: Colors.white,
              size: widget.appBar.preferredSize.height
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Invitado',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    widget.navigate('/');
                    widget.parentKey.currentState!.openEndDrawer();
                    //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //  content: Text('Iniciar sesión')
                    //));
                  },
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}