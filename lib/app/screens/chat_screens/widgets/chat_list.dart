import 'package:chatty/app/screens/chat_screens/Getx_helper/chat_space_controller.dart';
import 'package:chatty/app/screens/chat_screens/widgets/chat_left_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'chat_right_item.dart';

class ChatList extends GetView<ChatSpaceController> {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Container(
        padding: EdgeInsets.only( bottom: 50.h),
        child: CustomScrollView(
          shrinkWrap: true,
          reverse: true,
          controller: controller.msgScrolling,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric( vertical: 0.w, horizontal: 0.w),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var item = controller.state.chatData[index];
                    if(controller.state.toUserUid.value == item.sendBy){
                      return chatRightItem(item);
                    }
                    return chatLeftItem(item);
                  },
                  childCount: controller.state.chatData.length
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
