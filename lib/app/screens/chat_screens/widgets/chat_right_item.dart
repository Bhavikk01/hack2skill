import 'package:chatty/app/models/chat_space_model/chat_space_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/date.dart';

Widget chatRightItem(ChatSpaceModel item, bool isSameUser){
  return Container(
    padding: EdgeInsets.symmetric( horizontal: 10.w),
    alignment: Alignment.topRight,
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.all(14.w),
          constraints: BoxConstraints(
            maxWidth: 230.w,
            maxHeight: 1500.w,
          ),
          decoration: BoxDecoration(
            color: const Color(0xff00C2CB),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4.r,
                offset: const Offset(0,2),
              )
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.r),
              bottomLeft: Radius.circular(18.r),
              topRight: Radius.circular(18.r),
            ),
          ),
          child:  Text(
            item.message,
            maxLines: 10,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 10,
          child: Text(
            '${timeFormated(item.messageTm).hour}: ${timeFormated(item.messageTm).minute}' ,
            style: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
