import 'package:get/state_manager.dart';

class CountControllerWithGetx extends GetxController {
  RxInt count = 0.obs;

  void increase() {
    count++;
  }
}
