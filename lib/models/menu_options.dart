import 'package:park/models/models.dart';

class MenuOptions {
  MenuOptions(this._items);

  final Map<String, MenuOption> _items;

  MenuOption value(int index) {
    return _items.values.elementAt(index);
  }

  String key(int index) {
    return _items.keys.elementAt(index);
  }

  MenuOption item(String route) {
    final List<String> path = route.split('/');
    MenuOption item = _items[path[0]]!;
    for (var i = 1; i < path.length; i++) {
      String current = path[i];
      item = item.items![current]!;
    }
    return item;
  }
}