import 'package:get/get.dart';

import 'library.dart';

class PostBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<PostController>(() => PostController());
  }
}