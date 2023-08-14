import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  var currentIndex = 0;

  void changeIndex(index) {
    currentIndex = index;
    update();
  }
}
