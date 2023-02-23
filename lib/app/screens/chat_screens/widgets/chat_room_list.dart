import 'package:chatty/app/models/chat_room_model/chat_room_model.dart';
import 'package:chatty/app/routes/route_paths.dart';
import 'package:chatty/app/screens/chat_screens/Getx_helper/chat_room_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../models/users/user_model.dart';
import '../../../utils/date.dart';

class ChatRoomList extends GetView<ChatRoomController> {
  const ChatRoomList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SmartRefresher(
        controller: controller.refreshController,
        enablePullDown: true,
        enablePullUp: true,
        onLoading: controller.onLoading,
        onRefresh: controller.onRefresh,
        header: const WaterDropHeader(),
        child: !controller.isLoading.value ?
        ListView.builder(
          itemCount: controller.state.chatRoomList.length,
          itemBuilder: (context, index){
            if(controller.state.chatRoomList.isNotEmpty && controller.state.otherUser.isNotEmpty){
              var item = controller.state.chatRoomList[index];
              var otherUser = controller.state.otherUser[index];
              return chatRoomItem(item, otherUser);
            }else{
              return const CircularProgressIndicator();
            }
          },
          shrinkWrap: true,
        )
            : Container(),
      ),
    );
  }

  Widget chatRoomItem(ChatRoomModel item, UserModel otherUser){
    return Container(
      padding: EdgeInsets.symmetric( vertical: 10.w, horizontal: 10.w),
      child: InkWell(
        onTap: () {
          Get.toNamed(
            RoutePaths.chattingSpace,
            parameters: {
              "chatRoomId": item.chatRoomId,
              "toUserProfile": otherUser.photoId,
              "toUserName": otherUser.username,
              "toUserUid": otherUser.uid
            }
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric( horizontal: 0.w, vertical: 0.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.w
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                     color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                    offset: const Offset(0,2),
                  )
                ]
              ),
              child: CircleAvatar(
                radius: 25.r,
                backgroundImage: NetworkImage(
                  otherUser.photoId,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 280.w,
                  padding: EdgeInsets.only(left: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            otherUser.username,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            '${timeFormated(item.lastMessageTm).hour}: ${timeFormated(item.lastMessageTm).minute}' ,
                            style: GoogleFonts.poppins(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                      Text(
                        item.lastMessage,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}
