import 'package:chatty/app/screens/chat_screens/widgets/chat_room_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Getx_helper/chat_space_library.dart';

class ChatRoom extends GetView<ChatSpaceController> {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Messages",
          style: GoogleFonts.poppins(
            fontSize: 18.sp
          ),
        ),
      ),
      body: const ChatRoomList()
      );
  }
}

