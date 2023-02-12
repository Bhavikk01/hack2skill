import 'package:chatty/app/models/chat_space_model/chat_space_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget chatRightItem(ChatSpaceModel item){
  return Container(
    padding: EdgeInsets.symmetric( horizontal: 15.w, vertical: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 230.w,
            maxHeight: 40.w,
          ),
          child: Container(
            margin: EdgeInsets.only( right: 10.w, top: 0.w),
            padding: EdgeInsets.symmetric( vertical: 10.w, horizontal: 10.w),
            decoration: BoxDecoration(
                gradient: const LinearGradient( colors: [
                  Color.fromARGB(255, 176, 106, 231),
                  Color.fromARGB(255, 166, 112, 231),
                  Color.fromARGB(255, 131, 123, 231),
                  Color.fromARGB(255, 104, 132, 231),
                ],
                  transform: GradientRotation(90),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.r))
            ),
            child: Text(
                item.message
            ),
          ),
        )
      ],
    ),
  );
}