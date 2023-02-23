import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../store/user.dart';
import '../home_screens/getx_helper/library.dart';

class CreatePost extends GetView<PostController> {
  const CreatePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          child: Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
            child: GestureDetector(
              onTap: () async {
                await controller.createPost();
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only( left: 5.w, right: 20.w),
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
                    margin: EdgeInsets.only(top: 20.w),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 1,
                      controller: controller.createPostController,
                      decoration: InputDecoration(
                        labelText: "Label",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.h,
                    margin: EdgeInsets.symmetric(vertical: 15.w),
                    padding: EdgeInsets.only(right: 30.w),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 15.w),
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.photo,
                                  color: Colors.white,
                                  size: 23.h,
                                ),
                                SizedBox( width: 5.w,),
                                Text(
                                  "Add Photo",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            log('Hello');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 15.w),
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 15.h,
                                ),
                                SizedBox( width: 10.w,),
                                Text(
                                  "Post",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
