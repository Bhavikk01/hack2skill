import 'dart:developer';

import 'package:chatty/app/models/chat_space_model/chat_space_model.dart';
import 'package:chatty/app/screens/chat_screens/Getx_helper/chat_space_state.dart';
import 'package:chatty/app/services/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class ChatSpaceController extends GetxController{
  final state = ChatSpaceState();
  ChatSpaceController();
  final textController = TextEditingController();
  final msgScrolling = ScrollController();
  FocusNode contentNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    var chatData = Get.parameters;
    state.chatRoomId.value = chatData['chatRoomId']?? '';
    state.toUserProfile.value = chatData['toUserProfile']?? '';
    state.toUserName.value = chatData['toUserName']?? '';
    state.toUserUid.value = chatData['toUserUid']?? '';
  }

  sendMessage() async {
    String sendContent = textController.text;
    final content = ChatSpaceModel(
      message: sendContent,
      sendBy: state.toUserUid.value,
      messageTm: DateTime.now(),
      sendByPhoto: state.toUserProfile.value,
    );
    await FirebaseFireStore
        .to.sendMessage(
        content.toJson(), state.chatRoomId.value
    ).then((value) {
      textController.clear();
      Get.focusScope?.unfocus();
    });
    await FirebaseFireStore.to.updateMessage(
        {
          "lastMessage": sendContent,
          "lastMessageBy": state.toUserUid.value,
          "lastMessageTm": DateTime.now()
        },
        state.chatRoomId.value
    );
  }

  @override
  void onReady() {
    super.onReady();
    var messages = FirebaseFireStore.to.readMessage(state.chatRoomId.value);
    state.chatData.clear();
    messages.listen((snapshot) {
      for (var change in snapshot.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added :
            if (change.doc.data() != null) {
              state.chatData.insert(
                0,
                change.doc.data() as ChatSpaceModel,
              );
            }
            break;
          case DocumentChangeType.modified:
            break;
          case DocumentChangeType.removed:
            break;

          default:
            break;
        }
      }
    },onError: (error) => log("Listening failed: $error"));
  }

  @override
  void dispose() {
    msgScrolling.dispose();

    super.dispose();
  }
}