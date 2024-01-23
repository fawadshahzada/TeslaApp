import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget climateItemsButton(BuildContext context, IconData icon,VoidCallback onPressed,bool switchValue) {
  return Container(
width: 60.w,
height: 60.h,
    decoration: BoxDecoration(
      color: switchValue ? const Color(0xffEBEBF5).withOpacity(0.8) : const Color(0xffEBEBF5).withOpacity(0.8),
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: const Color(0xff000000).withOpacity(0.01),
          spreadRadius: 2,
          blurRadius: 2,
          offset: const Offset(0, -10),
        ),
        //shadow color 0xff00000 2% to the bottom side with more blur radius
        BoxShadow(
          color: const Color(0xff000000).withOpacity(0.01),
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(0, 2),
        ),
        //shadow color 0xff00000 2% to the left side with more blur radius
        BoxShadow(
          color: const Color(0xff000000).withOpacity(0.01),
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(-2, 0),
        ),
      ]
    ),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: switchValue ? const Color(0xff005EA3).withOpacity(0.8) : Colors.black,
        shape: CircleBorder(
          // the border color should have and linear gradient color #000000 45% and #FFFFFF 100%
          side: BorderSide(
            color: const Color(0xff000000).withOpacity(0.1),
            width: 2.5,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
      ),

      child: Icon(
        icon,
        fill: 1,
        color: const Color(0xffEBEBF5).withOpacity(0.8),
        size: 28.sp,
      ),
    ),
  );
}
