import 'package:first_attempt/controllers/bottom_navigation_controller.dart';
import 'package:first_attempt/controllers/controller.dart';
import 'package:get/get.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Controller());
    Get.lazyPut(() => BottomNavBarController());
  }
}
