import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

import 'package:park/providers/providers.dart';
import 'package:park/widgets/widgets.dart';

class Sidenav extends StatefulWidget {
  const Sidenav({
    Key? key,
    required parentKey,
    required appBar,
    required padding,
    required navigate,
  }) :
    _parentKey = parentKey,
    _appBar = appBar,
    _padding = padding,
    _navigate = navigate,
    super(key: key);

  final GlobalKey<ScaffoldState> _parentKey;
  final Toolbar _appBar;
  final double _padding;
  final ValueChanged<String> _navigate;

  GlobalKey<ScaffoldState> get parentKey => _parentKey;
  Toolbar get appBar => _appBar;
  double get padding => _padding;
  ValueChanged<String> get navigate => _navigate;

  @override
  State<Sidenav> createState() => _SidenavState();
}

class _SidenavState extends State<Sidenav> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: widget.appBar.preferredSize.height),
        child: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Header(
                widget: widget
              ),
              Expanded(
                child: _menu(context),
              )
            ],
          )
        ),
      ),
    );
  }

  ListView _menu(context) {
    ThemeData _theme = Theme.of(context);

    ScrollController _scroll = ScrollController();

    //_scroll.addListener(() {});

    return ListView.builder(
      controller: _scroll,
      itemCount: Menu.items.length,
      itemBuilder: (context, index) {
        final item = Menu.item(index);
        final route = Menu.key(index);
        final tile = ListTile(
          leading: Icon(
            item.icon,
            color: Colors.black,
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(item.label)
              ),
              if (item.badge != null) Badge(
                badgeContent: Text(
                  item.badge!,
                  style: const TextStyle(color: Colors.white),
                ),
                badgeColor: _theme.primaryColor,
                shape: BadgeShape.square,
                borderRadius: BorderRadius.circular(5),
              ),
            ]
          ),
          trailing: item.items != null ? MutableIcon(
            duration: const Duration(milliseconds: 300),
            startIcon: Icons.expand_more,
            endIcon: Icons.expand_less,
            startIconColor: Colors.black,
            endIconColor: Colors.black,
            controller: item.controller,
            initFrom: item.expanded ? InitFrom.end : InitFrom.start
          ) : null,
          onTap: () {
            if (item.items == null) {
              widget.parentKey.currentState!.openEndDrawer();
              widget.navigate(route);
            } else {
              Menu.item(index).expanded = !item.expanded;
              if (item.expanded) {
                final position = _scroll.position.pixels + kMinInteractiveDimension;
                _scroll.jumpTo(position);
                item.controller.animateToEnd();
              } else {
                item.controller.animateToStart();
              }
              setState(() {});
            }
          },
        );
        return item.items == null ? tile : Column(
          children: [
            tile,
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: child
                );
              },
              child: item.expanded ? Column(
                key: ValueKey<String>('submenu-$index'),
                children: List.generate(item.items!.length, (index) {
                  final subitem = item.items!.values.elementAt(index);
                  final subroute = item.items!.keys.elementAt(index);
                  return ListTile(
                    contentPadding: const EdgeInsets.only(left: 32),
                    leading: Icon(
                      subitem.icon,
                      color: Colors.black
                    ),
                    title: Text(subitem.label),
                    onTap: () {
                      widget.parentKey.currentState!.openEndDrawer();
                      widget.navigate('$route/$subroute');
                    },
                  );
                }).toList(),
              ) : null
            ),
          ],
        );
      }
    );
  }
}