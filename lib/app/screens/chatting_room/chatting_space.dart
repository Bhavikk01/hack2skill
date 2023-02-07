import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack2skill/app/services/providers.dart';

import '../../models/chat_models/chat_space/chat_space.dart';
import '../../models/enum/chat_status.dart';
import '../../models/user_model/user_model.dart';
import 'package:random_string/random_string.dart';

class ChattingSpace extends ConsumerStatefulWidget {
  final UserModel otherUser;
  final String chatStatus;
  final String chatRoomId, myProfilePic, myUserName;
  const ChattingSpace({super.key,required this.chatStatus, required this.otherUser,required this.chatRoomId,required this.myProfilePic, required this.myUserName});
  @override
  ConsumerState<ChattingSpace> createState() => _ChattingSpaceState();
}

class _ChattingSpaceState extends ConsumerState<ChattingSpace> {
  late String messageId = "";
  bool isLoading = false;
  TextEditingController messageTextEditingController = TextEditingController();

  getMyInfoFromSharedPreference() async {
    setState(() {
      isLoading = true;
    });
  }

  addMessage() {
    if (messageTextEditingController.text != "") {
      String message = messageTextEditingController.text;

      var lastMessageTs = DateTime.now();

      ChatSpace chatSpace = ChatSpace(
        message: message,
        sendBy: widget.myUserName,
        photoId: widget.myProfilePic,
        messageTime: lastMessageTs
      );

      if (messageId == "") {
        messageId = randomAlphaNumeric(12);
      }

      Map<String, dynamic> lastMessageInfoMap = {
        "lastMessage": message,
        "lastMessageTm": lastMessageTs,
        "lastMessageBy": widget.myUserName
      };
      ref.read(databaseProvider)
          .updateLastMessageSend(widget.chatRoomId, lastMessageInfoMap);
      ref.read(databaseProvider)
          .addMessage(widget.chatRoomId, messageId, chatSpace.toJson());
      messageTextEditingController.text = "";
      messageId = "";
    }
  }

  Widget chatMessageTile(String message, bool sendByMe) {
    return Row(
      mainAxisAlignment:
      sendByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(24),
                  bottomRight:
                  sendByMe ? const Radius.circular(0) : const Radius.circular(24),
                  topRight: const Radius.circular(24),
                  bottomLeft:
                  sendByMe ? const Radius.circular(24) : const Radius.circular(0),
                ),
                color: sendByMe ? Colors.blue : const Color(0xfff1f0f0),
              ),
              padding: const EdgeInsets.all(16),
              child: Text(
                message,
                style: TextStyle(color: sendByMe ? Colors.white : Colors.black),
              )),
        ),
      ],
    );
  }

  Widget chatMessages() {
    return StreamBuilder(
      stream: ref.watch(databaseProvider).getChatRoomMessages(widget.chatRoomId),
      builder: (context, snapshot) {
        log('Here is the data: ${snapshot.data?.docs.length}');
        return snapshot.hasData
            ? ListView.builder(
            padding: const EdgeInsets.only(bottom: 70, top: 16),
            itemCount: snapshot.data!.docs.length,
            reverse: true,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data!.docs[index];
              return chatMessageTile(
                  ds["message"], widget.myUserName == ds["sendBy"]);
            })
            : const Center(child: CircularProgressIndicator());
      },
    );
  }


  @override
  void initState() {
    getMyInfoFromSharedPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
      appBar: AppBar(
        title: Text(widget.otherUser.username),
        leading: Padding(
          padding: const EdgeInsets.all(7.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              widget.otherUser.photoId,
            ),
          ),
        ),
        actions: [
          widget.chatStatus == chatStatusToString(ChatStatus.casual)
              ? Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric( vertical: 10, horizontal: 10),
            padding: const EdgeInsets.symmetric( vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text("Dispatch", style: TextStyle(fontSize: 15,color: Colors.black)),
          )
              : Container()
        ],
      ),
      body: Stack(
        children: [
          chatMessages(),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: messageTextEditingController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "type a message",
                            hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.6))),
                      )),
                  GestureDetector(
                    onTap: () {
                      addMessage();
                    },
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    )
        : Container();
  }
}