import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';

Widget climateItemsButton(BuildContext context, IconData icon,VoidCallback onPressed,bool switchValue) {
  return switchValue?
      Container(
        height: 60.h,
        width: 60.w,
        decoration: BoxDecoration(
          color: Color(0xff005EA3).withOpacity(0.6),
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: GestureDetector(
          onTap: onPressed,
          child: Icon(
            icon,
            fill: 1,
            color: const Color(0xffEBEBF5).withOpacity(0.8),
            size: 28.sp,
          ),
        ),
      )
      :GlassmorphicContainer(
    width: 60.w,
    height: 60.h,
    borderRadius: 40.r,
    blur: 17,
    alignment: Alignment.center,
    border: 1.5,
    linearGradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xffFFFFFF).withOpacity(0.001),
        const Color(0xffFFFFFF).withOpacity(0.001),
        //const Color(0xff000000).withOpacity(0.01),
        const Color(0xff000000).withOpacity(0.001),
      ],
      stops: const [
        0.1,
        0.5,
        1,
      ],
    ),
    borderGradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xff000000).withOpacity(0.6),
        const Color(0xff000000).withOpacity(0.6),
        const Color(0xffffffff).withOpacity(0.01),
      ],
      stops: const [
        0.0,
        0.6,
        1,
      ],
    ),
    child: GestureDetector(
      onTap: onPressed,
      child: Icon(
        icon,
        fill: 1,
        color: const Color(0xffEBEBF5).withOpacity(0.8),
        size: 28.sp,
      ),
    ),
  );
}
