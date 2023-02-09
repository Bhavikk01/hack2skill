import 'package:chatty/app/screens/welcome_screen/Getx_helper/controller.dart';
import 'package:get/get.dart';

class WelcomeBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}