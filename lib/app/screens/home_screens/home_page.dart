import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../store/user.dart';
import 'getx_helper/library.dart';

class HomePage extends GetView<PostController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
            () => SmartRefresher(
              enablePullDown: true,
              physics: const BouncingScrollPhysics(),
              onLoading: controller.onLoading,
              onRefresh: controller.onRefresh,
              controller: controller.refreshController,
              header: const WaterDropHeader(),
              child: !controller.isLoading.value ?
              Container(
            padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 10.w),
            child: ListView.builder(
              itemCount: controller.state.posts.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only( left: 5.w, right: 10.w),
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
                                UserStore.to.profile.photoId,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Bhavik Kothari',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'This is my bio data' ,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only( left: 5.w, top: 10.w),
                        child: Text(
                          "This is the post description of your post This is the post description of your post This is the post description of your post This is the post description of your post This is the post description of your post.",
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            constraints: BoxConstraints(
                                maxHeight: 300.h,
                                minHeight: 20.h
                            ),
                            margin: EdgeInsets.symmetric(vertical: 15.w),
                            decoration: BoxDecoration(
                              color: Colors.grey[350],
                              // image: DecorationImage(
                              //   image: NetworkImage(
                              //     "",
                              //   ),
                              //   fit: BoxFit.contain
                              // )
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50.h,
                              margin: EdgeInsets.symmetric(vertical: 15.w),
                              padding: EdgeInsets.only(right: 30.w),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.thumb_up,
                                          // color: isLiked? Colors.blueAccent : Colors.grey,
                                          color: Colors.blueAccent,
                                          size: 25.h,
                                        ),
                                        onPressed: () {},
                                      ),
                                      Text(
                                        "Like",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.comment,
                                          // color: isLiked? Colors.red : Colors.grey,
                                          color: Colors.blueAccent,
                                          size: 25.h,
                                        ),
                                        onPressed: () {},
                                      ),
                                      Text(
                                        "Comment",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.share,
                                          // color: isLiked? Colors.red : Colors.grey,
                                          color: Colors.blueAccent,
                                          size: 25.h,
                                        ),
                                        onPressed: () {},
                                      ),
                                      Text(
                                        "Share",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 2.h,
                      )
                    ],
                  ),
                );
              },
            ),
          ) : Container(),
        ),
      ),
    );
  }
}