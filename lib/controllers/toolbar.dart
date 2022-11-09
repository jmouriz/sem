import 'package:get/get.dart';
import 'package:park/widgets/widgets.dart';

class ToolbarController extends GetxController {
  final MutableIconController leadingController = MutableIconController();
  //final MutableIconsController trailingController = MutableIconsController();

  var actions = [].obs;

  void reset() {
    actions.value = [];
  }
}
