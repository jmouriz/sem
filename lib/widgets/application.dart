import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:park/widgets/widgets.dart';
import 'package:park/controllers/controllers.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  String _child = 'home';
  bool _loading = false;
  int _count = 0;
  final _controller = Get.put(ApplicationController());
  final ScrollController _scroll = ScrollController();
  final double _padding = 8.0;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  void _navigate(String route) {
    if (_child != route) {
      Get.find<ToolbarController>().reset();
      setState(() {
        _child = route;
      });
    }
  }

  void _update() {
    setState(() {});
  }

  @override
  void initState() {
    _controller.setState = _update;
    _controller.navigate = _navigate;
    _controller.key = _key; // XXX

    _scroll.addListener(() {
      if (_scroll.position.pixels < 0) return;
      if (_scroll.position.pixels >= _scroll.position.maxScrollExtent) {
        _fetch();
      }
    });

    super.initState();
  }

  Future _fetch() async {
    if (_loading) return;
    _loading = true;
    _count++;
    print('start: ($_count) ${DateTime.now().millisecondsSinceEpoch}');
    await Future.delayed(const Duration(seconds: 3));
    print('end: ($_count) ${DateTime.now().millisecondsSinceEpoch}');
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
    final Toolbar _toolbar = Toolbar(
      parentKey: _key,
      child: _child,
    );

    final _searchbarController = Get.put(SearchbarController());
    final Searchbar _searchbar = Searchbar(
      parentKey: _key,
      child: _child,
      count: _searchbarController.conditions.length,
    );

    PreferredSizeWidget _header;

    Color? _backgroundColor =
        _controller.dark ? Colors.grey[900] : Colors.grey[300];

    if (_controller.searching.value) {
      _header = _searchbar;
    } else {
      _header = _toolbar;
    }

    return Scaffold(
      key: _key,
      appBar: _header,
      backgroundColor: _backgroundColor,
      drawerScrimColor: Colors.transparent,
      drawerEnableOpenDragGesture: false,
      onDrawerChanged: (opened) {
        if (!_controller.searching.value) {
          _toolbar.update(opened);
        }
      },
      drawer: Sidenav(
        parentKey: _key,
        appBar: _toolbar,
        padding: _padding,
        navigate: _navigate,
      ),
      body: Body(
        child: _child,
        scroll: _scroll,
        padding: _padding,
      ),
    );
  }
}
