import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hack2skill/app/config/router_path.dart';
import 'package:hack2skill/app/models/enum/chat_status.dart';
import 'package:hack2skill/app/services/providers.dart';

import '../../models/chat_models/chat_room/chat_room.dart';
import '../../models/user_model/user_model.dart';
import '../../services/shared_preference.dart';

class ChattingRoom extends ConsumerStatefulWidget {
  final ChatStatus chatStatus;
  const ChattingRoom({required this.chatStatus, super.key});

  @override
  ConsumerState<ChattingRoom> createState() => _ChattingRoomState();
}

class _ChattingRoomState extends ConsumerState<ChattingRoom> {
  bool isSearching = false;
  bool isLoading = false;
  late String myName, myProfilePic, myUserName, myEmail, myUid;
  late Stream usersStream, chatRoomsStream;
  List<ChatRoom> chatRoomsFound = [];

  TextEditingController searchUsernameEditingController =
  TextEditingController();
  getMyInfoFromSharedPreference() async {
    myUid = await SharedPreferenceHelper().getUserId();
    myProfilePic = await SharedPreferenceHelper().getUserProfileUrl();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    chatRoomsStream = await ref.read(databaseProvider).getChatRooms(myUid,chatStatusToString(widget.chatStatus));
    myUserName = await SharedPreferenceHelper().getUserName();
    setState(() {
      isLoading = true;
    });
  }

  getChatRoomIdByUsernames(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  onSearchBtnClick() {
    isSearching = true;
    setState(() {});
    usersStream = ref.watch(databaseProvider)
        .getUserByUserName(searchUsernameEditingController.text);
    setState(() {});
  }

  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRoomsStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active &&
            snapshot.data != null) {
          if (!snapshot.hasData) {
            return const Text("HelloWorld");
          }

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var otherUserId = '';
                DocumentSnapshot ds = snapshot.data!.docs[index];
                for(var userId in ds['users']){
                  if(userId != myUid){
                    otherUserId = userId;
                  }
                }
                return ChatRoomListTile(
                    otherUserId: otherUserId,
                    lastMessage: ds["lastMessage"],
                    chatRoomId: ds.id,
                    myPhotoId: myProfilePic,
                    chatStatus: ds["chatStatus"],
                    myUserName: myUserName);
              });
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget searchListUserTile({String? profileUrl, username}) {
    return GestureDetector(
      onTap: () async {
        var chatRoomId = getChatRoomIdByUsernames(myUid, username);
        ChatRoom chatRoom = ChatRoom(
            lastMessage: "",
            lastMessageBy: "",
            lastMessageTm: DateTime.now(),
            users: [myUid, username],
          chatStatus: chatStatusToString(ChatStatus.casual)
        );

        UserModel otherUser = (await ref.read(databaseProvider).getUser(username))!;
        chatRoom = await ref.read(databaseProvider)
            .createChatRoom(chatRoomId, chatRoom.toJson());
        Get.toNamed(RoutePaths.chattingSpace,
            arguments: {
              "otherUser": otherUser,
              "myProfilePic": myProfilePic,
              "chatRoomId": chatRoomId,
              "myUserName": myUserName,
              "chatStatus": chatRoom.chatStatus
            });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: profileUrl != null
                  ? Image.network(
                profileUrl,
                height: 40,
                width: 40,
              )
                  : Container(
                color: Colors.black,
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(width: 12),
            Text(username)
          ],
        ),
      ),
    );
  }

  Widget searchUsersList() {
    return StreamBuilder(
      stream: usersStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
            itemCount: snapshot.data!.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data!.docs[index];
              return searchListUserTile(
                  profileUrl: ds['photoId'],
                  username: ds['uid']);
            })
            : const Center(child: CircularProgressIndicator());
      },
    );
  }

  // getChatRooms() async {
  //   chatRoomsStream = await ref.read(databaseProvider).getChatRooms(myUid, chatStatusToString(widget.chatStatus));
  //   setState(() {});
  // }

  onScreenLoaded() async {
    await getMyInfoFromSharedPreference();
  }

  @override
  void initState() {
    onScreenLoaded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child:
          isLoading
              ? Column(
            children: [
              Row(
                children: [
                  isSearching
                      ? GestureDetector(
                    onTap: () {
                      isSearching = false;
                      searchUsernameEditingController.text = "";
                      setState(() {});
                    },
                    child: const Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Icon(Icons.arrow_back)),
                  )
                      : Container(),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(24)),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                                controller: searchUsernameEditingController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none, hintText: "username"),
                              )),
                          GestureDetector(
                              onTap: () {
                                if (searchUsernameEditingController.text != "") {
                                  onSearchBtnClick();
                                }
                              },
                              child: const Icon(Icons.search))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              isSearching ? searchUsersList() : chatRoomsList()
            ],
          )
              : const Text("Hello"),
        ),
      ),
    );
  }
}


class ChatRoomListTile extends ConsumerStatefulWidget {
  final String otherUserId;
  final String lastMessage;
  final String chatRoomId;
  final String myPhotoId;
  final String myUserName;
  final String chatStatus;
  const ChatRoomListTile({Key? key,
    required this.otherUserId,
    required this.lastMessage,
    required this.chatRoomId,
    required this.chatStatus,
    required this.myPhotoId,
    required this.myUserName}) : super(key: key);

  @override
  ConsumerState<ChatRoomListTile> createState() => _ChatRoomListTileState();
}

class _ChatRoomListTileState extends ConsumerState<ChatRoomListTile> {
  late UserModel otherUser;
  bool isLoading = false;

  loadUserData() async {
    otherUser = (await ref.read(databaseProvider).getUser(widget.otherUserId))!;
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? GestureDetector(
      onTap: () {
        Get.toNamed(RoutePaths.chattingSpace,
            arguments: {
              "otherUser": otherUser,
              "myProfilePic": widget.myPhotoId,
              "chatRoomId": widget.chatRoomId,
              "myUserName": widget.myUserName,
              "chatStatus": widget.chatStatus
            });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                otherUser.photoId,
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  otherUser.username,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 3),
                Text(widget.lastMessage == '' ? "Start your conversation" : widget.lastMessage)
              ],
            )
          ],
        ),
      ),
    )
        : Container();
  }
}