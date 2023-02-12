import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatty/app/models/chat_room_model/chat_room_model.dart';
import 'package:chatty/app/routes/route_paths.dart';
import 'package:chatty/app/screens/chat_screens/Getx_helper/chat_room_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../models/users/user_model.dart';

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
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.w),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var item = controller.state.chatRoomList[index];
                    var otherUser = controller.state.otherUser[index];
                    return chatRoomItem(item, otherUser);
                  },
                  childCount: controller.state.chatRoomList.length
                ),
              ),
            )
          ],
        ),

      ),
    );
  }

  Widget chatRoomItem(ChatRoomModel item, UserModel otherUser){
    return Container(
      padding: EdgeInsets.symmetric( vertical: 5.w, horizontal: 8.w),
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
          children: [
            Container(
              padding: EdgeInsets.symmetric( horizontal: 8.w, vertical: 0.w),
              child: SizedBox(
                width: 54.w,
                height: 54.w,
                child: CachedNetworkImage(
                  imageUrl: otherUser.photoId,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 54.w,
                    width: 54.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric( vertical: 0.w, horizontal: 5.w),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xffe5e5e5)
                  )
                )
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 48.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          otherUser.username
                        ),
                        Text(
                            item.lastMessage
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
