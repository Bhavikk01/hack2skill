import 'package:get/get.dart';
import 'controller.dart';

class HomeScreenBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}