import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget settingButton(BuildContext context, IconData icon,VoidCallback onPressed) {
  return Material(
    elevation: 30,
    color: Colors.transparent,
    shape: const CircleBorder(),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xffFFFFFF).withOpacity(0.04),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, -10),
          ),
          // shadow color 0xff00000 2% to the bottom side with more blur radius
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.02),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 2),
          ),
          // shadow color 0xff00000 2% to the left side with more blur radius
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.02),
            spreadRadius: 5,
            blurRadius: 20,
            offset: const Offset(-2, 0),
          ),
        ]
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: CircleBorder(
            // the border color should have and linear gradient color #000000 45% and #FFFFFF 100%
            side: BorderSide(
              color: const Color(0xff000000).withOpacity(0.1),
              width: 1,
            ),
          ),
          elevation: 0,
        ),

        child: Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            color: Colors.transparent,
            //border color should be #000000 45% and #FFFFFF 100%
            border: Border.all(
              color: const Color(0xff202224).withOpacity(0.6),
              width: 1,),
            borderRadius: BorderRadius.circular(40.r),
            // shadow that goes inside the box making the child look shallower
            boxShadow: [
              // shadow color 0xff00000 2% to the top side with more blur radius
              BoxShadow(
                color: const Color(0xffEBEBF5).withOpacity(0.09),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(-6, -8),
              ),
              BoxShadow(
                color: const Color(0xffEBEBF5).withOpacity(0.01),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: const Color(0xffEBEBF5).withOpacity(0.6),
            size: 24.sp,
          ),
        ),
      ),
    ),
  );
}
