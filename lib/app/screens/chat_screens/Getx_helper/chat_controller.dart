import 'package:get/get.dart';

import '../../../models/chat_room_model/chat_room_model.dart';
import '../../../models/users/user_model.dart';
import '../../../routes/route_paths.dart';
import '../../../services/firebase.dart';

class ChatController extends GetxController{
  RxList<UserModel> users = <UserModel>[].obs;

  @override
  Future<void> onInit() async {
    await loadUsers();
    super.onInit();
  }

  loadUsers() async {
    users.clear();
    var usersData = FirebaseFireStore.to.getAllUsers();

    usersData.listen((userSnapshot) {
      for(var userElement in userSnapshot.docs){
        users.add(
          UserModel.fromJson(userElement.data() as Map<String, dynamic>)
        );
      }
    });
  }

  createChatRoom(ChatRoomModel chatRoomModel, UserModel otherUser) async {
    await FirebaseFireStore.to.createChatRoom(chatRoomModel);
    Get.toNamed(
        RoutePaths.chattingSpace,
        parameters: {
          "chatRoomId": chatRoomModel.chatRoomId,
          "toUserProfile": otherUser.photoId,
          "toUserName": otherUser.username,
          "toUserUid": otherUser.uid
        }
    );
  }

  generateChatRoomId(String myUserUid, String otherUserId) {
    if (myUserUid.substring(0, 1).codeUnitAt(0) > otherUserId.substring(0, 1).codeUnitAt(0)) {
      return "$otherUserId\_$myUserUid";
    } else {
      return "$myUserUid\_$otherUserId";
    }
  }
}