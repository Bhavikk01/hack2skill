import 'package:chatty/app/models/chat_room_model/chat_room_model.dart';
import 'package:chatty/app/routes/route_paths.dart';
import 'package:chatty/app/screens/chat_screens/Getx_helper/chat_controller.dart';
import 'package:chatty/app/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatHomePage extends GetView<ChatController> {
  ChatHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.loadUsers();
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 15.w, vertical: 10.w),
      child: Obx(
          () => ListView.builder(
          shrinkWrap: true,
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                String chatRoomId = controller.generateChatRoomId(UserStore.to.uid, controller.users[index].uid);
                ChatRoomModel chatRoomModel = ChatRoomModel(
                  users: [UserStore.to.uid, controller.users[index].uid],
                  usersProfile: [UserStore.to.profile.photoId, controller.users[index].photoId],
                  usersName: [UserStore.to.profile.username, controller.users[index].username],
                  lastMessage: "",
                  lastMessageBy: "",
                  lastMessageTm:  DateTime.now(),
                  chatRoomId: chatRoomId,
                );
                controller.createChatRoom(chatRoomModel, controller.users[index]);
                Get.toNamed(
                    RoutePaths.chattingSpace,
                    parameters: {
                      "chatRoomId": chatRoomId,
                      "toUserProfile": controller.users[index].photoId,
                      "toUserName": controller.users[index].username,
                      "toUserUid": controller.users[index].uid
                    }
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.5),
                child: ListTile(
                  title: Text(
                    controller.users[index].username,
                  ),
                ),
              ),
            );
          }),
      ),
    );
  }
}