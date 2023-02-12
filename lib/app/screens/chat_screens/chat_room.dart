import 'package:chatty/app/screens/chat_screens/widgets/chat_room_list.dart';
import 'package:chatty/app/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Getx_helper/chat_space_library.dart';

class ChatRoom extends GetView<ChatSpaceController> {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(
        title: Text(
          "Messages",
          style: TextStyle(
            fontSize: 18.sp
          ),
        ),
      ),
      body: const ChatRoomList()
    );
  }
}

