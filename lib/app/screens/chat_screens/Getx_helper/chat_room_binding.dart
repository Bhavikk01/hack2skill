
import 'package:get/get.dart';

import 'chat_room_controller.dart';

class ChatRoomBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<ChatRoomController>(() => ChatRoomController());
  }

}