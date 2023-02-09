import 'package:get/get.dart';

import 'controller.dart';

class ChatScreenBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<ChatScreenController>(() => ChatScreenController());
  }
}