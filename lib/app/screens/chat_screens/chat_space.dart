import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatty/app/screens/chat_screens/widgets/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Getx_helper/chat_space_library.dart';

class ChatSpace extends GetView<ChatSpaceController> {
  const ChatSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient( colors: [
              Color.fromARGB(255, 176, 106, 231),
              Color.fromARGB(255, 166, 112, 231),
              Color.fromARGB(255, 131, 123, 231),
              Color.fromARGB(255, 104, 132, 231),
            ],
              transform: GradientRotation(90),
            ),
          ),
        ),
        title: Container(
          padding: EdgeInsets.only( top: 0.w, bottom: 0.w, right: 0.w),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only( top: 0.w, bottom: 0.w, right: 0.w),
                child: InkWell(
                  child: SizedBox(
                    width: 44.w,
                    height: 44.w,
                    child: CachedNetworkImage(
                      imageUrl: controller.state.toUserProfile.value,
                      imageBuilder: (context, imageProvider){
                        return Container(
                          height: 44.w,
                          width: 44.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(44.r),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover
                            )
                          ),
                        );
                      },
                      errorWidget: (context, url, error){
                        return Container();
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.w,),
              Container(
                // width: 100.w,
                padding: EdgeInsets.only( top:  0.w, bottom: 0.w, right: 0.w),
                child: Row(
                  children: [
                    SizedBox(
                      // width: 100.w,
                      height: 44.w,
                      child: GestureDetector(
                        onTap: (){

                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.state.toUserName.value,
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.averiaLibre(
                                fontSize: 16.sp,
                                color: Colors.white
                              ),
                            ),
                            Text(
                              'Unknown location',
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.averiaLibre(
                                  fontSize: 16.sp,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Stack(
            children: [
              ChatList(),
              Positioned(
                bottom: 0.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  color: Colors.transparent,
                  height: 50.h,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 250.h,
                        child: TextField(
                          controller: controller.textController,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Send a message',
                          ),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.sendMessage();
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Color(0xff00c2cb),
                        ),
                        iconSize: 25.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
