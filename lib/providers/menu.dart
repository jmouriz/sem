import 'package:flutter/material.dart' show Icons;
import 'package:park/models/models.dart';
import 'package:park/pages/pages.dart';

class Menu {
  static MenuOption item(int index) {
    return items.values.elementAt(index);
  }

  static String key(int index) {
    return items.keys.elementAt(index);
  }

  static MenuOption get(String route) {
    final List<String> path = route.split('/');
    MenuOption item = items[path[0]]!;
    for (var i = 1; i < path.length; i++) {
      String current = path[i];
      item = item.items![current]!;
    }
    return item;
  }

  static Map<String, MenuOption> items = {
    'home': MenuOption(
      icon: Icons.home,
      label: 'Inicio',
      title: 'Bienvenido',
      target: const Home(),
    ),
    'info': MenuOption(
      icon: Icons.info,
      label: 'Información',
      target: const Info(),
    ),
    'login': MenuOption(
      icon: Icons.login,
      label: 'Ingresar',
      target: const Child1(),
    ),
    'account': MenuOption(
      icon: Icons.account_circle,
      label: 'Cuenta',
      target: const Child2(),
    ),
    'documents': MenuOption(
      icon: Icons.description_rounded,
      label: 'Documentación',
      target: const Child3(),
    ),
    'vehicles': MenuOption(
      icon: Icons.directions_car_filled_rounded,
      label: 'Vehículos',
      target: const Vehicles(),
    ),
    'promos': MenuOption(
      icon: Icons.card_giftcard,
      label: 'Promociones',
      target: const Test(),
    ),
    'wallet': MenuOption(
      icon: Icons.wallet,
      label: 'Billetera',
      target: const ToDo(),
      items: {
        'balance': MenuOption(
          icon: Icons.account_balance,
          label: 'Consultar saldo',
          title: 'Saldo',
          target: const Balance(),
        ),
        'transfer': MenuOption(
          icon: Icons.swap_horiz,
          label: 'Transferencias',
          target: const ToDo(),
        ),
        'intakes': MenuOption(
          icon: Icons.show_chart,
          label: 'Movimientos',
          target: const ToDo(),
        ),
      }
    ),
    'map': MenuOption(
      icon: Icons.map,
      label: 'Zona medida',
      target: const ToDo(),
    ),
    'pos': MenuOption(
      icon: Icons.store_rounded,
      label: 'Puntos de venta',
      target: const ToDo(),
    ),
    'notification': MenuOption(
      icon: Icons.notifications,
      label: 'Notificaciones',
      badge: ' 3 ',
      target: const ToDo(),
    ),
    'manager': MenuOption(
      icon: Icons.business_center,
      label: 'Administración',
      items: {
        'tickets': MenuOption(
          icon: Icons.receipt_long,
          label: 'Tickets',
          target: const ToDo(),
        ),
        'users': MenuOption(
          icon: Icons.people,
          label: 'Usuarios',
          target: const ToDo(),
        ),
        'intakes': MenuOption(
          icon: Icons.manage_search,
          label: 'Movimientos',
          target: const ToDo(),
        ),
        'vehicles': MenuOption(
          icon: Icons.directions_car_filled_rounded,
          label: 'Vehículos',
          target: const ToDo(),
        ),
        'inspections': MenuOption(
          icon: Icons.remove_red_eye,
          label: 'Inspecciones',
          target: const ToDo(),
        ),
        'infractions': MenuOption(
          icon: Icons.report_problem_rounded,
          label: 'Infracciones',
          target: const ToDo(),
        ),
        'excludes': MenuOption(
          icon: Icons.visibility_off,
          label: 'Excluidos',
          target: const ToDo(),
        ),
        'documents': MenuOption(
          icon: Icons.description_rounded,
          label: 'Documentación',
          target: const ToDo(),
        ),
      }
    ),
    'config': MenuOption(
      icon: Icons.build,
      label: 'Configuración',
      items: {
        'info': MenuOption(
          icon: Icons.info,
          label: 'Información',
          target: const ToDo(),
        ),
        'account': MenuOption(
          icon: Icons.account_balance,
          label: 'Cuenta',
          target: const ToDo(),
        ),
        'prices': MenuOption(
          icon: Icons.monetization_on,
          label: 'Precios',
          target: const ToDo(),
        ),
        'pos': MenuOption(
          icon: Icons.store_rounded,
          label: 'Puntos de venta',
          target: const ToDo(),
        ),
        'zones': MenuOption(
          icon: Icons.map,
          label: 'Zonas medidas',
          target: const ToDo(),
        ),
        'promos': MenuOption(
          icon: Icons.card_giftcard,
          label: 'Promociones',
          target: const ToDo(),
        ),
      }
    ),
    'preferences': MenuOption(
      icon: Icons.settings,
      label: 'Preferencias',
      target: const Preferences(),
    ),
    'help': MenuOption(
      icon: Icons.help_sharp,
      label: 'Ayuda',
      target: Help(),
    ),
    'contact': MenuOption(
      icon: Icons.message_sharp,
      label: 'Contacto',
      target: const ToDo(),
    ),
    'development': MenuOption(
      icon: Icons.construction,
      label: 'Desarrollo',
      items: {
        'cities': MenuOption(
          icon: Icons.location_city,
          label: 'Ciudades',
          target: const ToDo(),
        ),
        'servers': MenuOption(
          icon: Icons.dns,
          label: 'Servidores',
          target: const ToDo(),
        ),
        'database': MenuOption(
          icon: Icons.cloud,
          label: 'Base de datos',
          target: const ToDo(),
        ),
        'queries': MenuOption(
          icon: Icons.search,
          label: 'Consultas',
          target: const ToDo(),
        ),
      }
    ),
    'about': MenuOption(
      icon: Icons.star,
      label: 'Acerca de esta app',
      target: const About(),
    ),
    'logout': MenuOption(
      icon: Icons.logout,
      label: 'Salir',
      target: const ToDo(),
    ),
  };
}

/*
final menu = MenuOptions({
  'home': MenuOption(
    icon: Icons.home,
    label: 'Inicio',
    title: 'Bienvenido',
    target: const Child1(),
  ),
  'info': MenuOption(
    icon: Icons.info,
    label: 'Información',
    target: const Child2(),
  ),
  'login': MenuOption(
    icon: Icons.login,
    label: 'Ingresar',
    target: const Child3(),
  ),
  'account': MenuOption(
    icon: Icons.account_circle,
    label: 'Cuenta',
    target: const Child4(),
  ),
  'documents': MenuOption(
    icon: Icons.description_rounded,
    label: 'Documentación',
    target: const ToDo(),
  ),
  'vehicles': MenuOption(
    icon: Icons.directions_car_filled_rounded,
    label: 'Vehículos',
    target: const Vehicles(),
  ),
  'promos': MenuOption(
    icon: Icons.card_giftcard,
    label: 'Promociones',
    target: const ToDo(),
  ),
  'wallet': MenuOption(
    icon: Icons.wallet,
    label: 'Billetera',
    target: const ToDo(),
    items: {
      'balance': MenuOption(
        icon: Icons.account_balance,
        label: 'Consultar saldo',
        target: const ToDo(),
      ),
      'transfer': MenuOption(
        icon: Icons.swap_horiz,
        label: 'Transferencias',
        target: const ToDo(),
      ),
      'intakes': MenuOption(
        icon: Icons.show_chart,
        label: 'Movimientos',
        target: const ToDo(),
      ),
    }
  ),
  'map': MenuOption(
    icon: Icons.map,
    label: 'Zona medida',
    target: const ToDo(),
  ),
  'pos': MenuOption(
    icon: Icons.store_rounded,
    label: 'Puntos de venta',
    target: const ToDo(),
  ),
  'notification': MenuOption(
    icon: Icons.notifications,
    label: 'Notificaciones',
    badge: '3',
    target: const ToDo(),
  ),
  'manager': MenuOption(
    icon: Icons.business_center,
    label: 'Administración',
    target: const ToDo(),
    items: {
      'tickets': MenuOption(
        icon: Icons.receipt_long,
        label: 'Tickets',
        target: const ToDo(),
      ),
      'users': MenuOption(
        icon: Icons.people,
        label: 'Usuarios',
        target: const ToDo(),
      ),
      'intakes': MenuOption(
        icon: Icons.manage_search,
        label: 'Movimientos',
        target: const ToDo(),
      ),
      'vehicles': MenuOption(
        icon: Icons.directions_car_filled_rounded,
        label: 'Vehículos',
        target: const ToDo(),
      ),
      'inspections': MenuOption(
        icon: Icons.remove_red_eye,
        label: 'Inspecciones',
        target: const ToDo(),
      ),
      'infractions': MenuOption(
        icon: Icons.report_problem_rounded,
        label: 'Infracciones',
        target: const ToDo(),
      ),
      'excludes': MenuOption(
        icon: Icons.visibility_off,
        label: 'Excluidos',
        target: const ToDo(),
      ),
    }
  ),
  'preferences': MenuOption(
    icon: Icons.settings,
    label: 'Preferencias',
    target: const ToDo(),
  ),
  'help': MenuOption(
    icon: Icons.help_sharp,
    label: 'Ayuda',
    target: const ToDo(),
  ),
  'contact': MenuOption(
    icon: Icons.message_sharp,
    label: 'Contacto',
    target: const ToDo(),
  ),
  'logout': MenuOption(
    label: 'Salir',
    target: const ToDo(),
  ),
});
*/