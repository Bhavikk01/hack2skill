import 'package:chatty/app/models/chat_space_model/chat_space_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/date.dart';

Widget chatLeftItem(ChatSpaceModel item, bool isSameUser){
  return Container(
    padding: EdgeInsets.symmetric( horizontal: 10.w),
    alignment: Alignment.topLeft,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0.w, 5.w, 5.w, 0.w),
          child: CircleAvatar(
            radius: 13.r,
            backgroundImage: NetworkImage(
              item.sendByPhoto,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(14.w),
          constraints: BoxConstraints(
            maxWidth: 230.w,
            maxHeight: 1500.w,
          ),
          decoration: BoxDecoration(
              color: const Color(0xff005F99),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.r),
                bottomRight: Radius.circular(18.r),
                topRight: Radius.circular(18.r),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4.r,
                    offset: const Offset(0,2)
                )
              ]
          ),
          child: Text(
            item.message,
            maxLines: 10,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                color: Colors.white
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
