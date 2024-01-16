import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget settingButton(BuildContext context, IconData icon,VoidCallback onPressed) {
  return Material(
    elevation: 100,
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
          // BoxShadow(
          //   offset: Offset(4, 8),
          //   blurRadius: 5,
          //   spreadRadius: -20,
          //   color: Colors.black.withOpacity(0.2),
          //   inset: true,
          // ),
          // BoxShadow(
          //   offset: Offset(4, 8),
          //   blurRadius: 10,
          //   spreadRadius: -5,
          //   color: Colors.black.withOpacity(0.4),
          //   inset: true,
          // ),
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
              color: const Color(0xff202224).withOpacity(1),
              width: 1.5,),
            borderRadius: BorderRadius.circular(40.r),
            // shadow that goes inside the box making the child look shallower
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 8),
                blurRadius: 5,
                spreadRadius: -20,
                color: Colors.black.withOpacity(0.2),
                inset: true,
              ),
              BoxShadow(
                offset: Offset(4, 8),
                blurRadius: 10,
                spreadRadius: -5,
                color: Colors.black.withOpacity(0.4),
                inset: true,
              ),
              // shadow color 0xff00000 2% to the top side with more blur radius
              BoxShadow(
                color: const Color(0xffEBEBF5).withOpacity(0.02),
                spreadRadius: 10,
                blurRadius: 10,
                offset: const Offset(-6, -6),
              ),
              BoxShadow(
                color: const Color(0xffEBEBF5).withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
              BoxShadow(
                color: const Color(0xffEBEBF5).withOpacity(0.03),
                spreadRadius: 10,
                blurRadius: 10,
                offset: const Offset(4, 6),
              ),
              BoxShadow(
                color: const Color(0xffEBEBF5).withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            shadowColor: Colors.white.withOpacity(1),
            shape: const CircleBorder(),
            child: Icon(
              icon,
              color: const Color(0xffEBEBF5).withOpacity(0.8),
              size: 24.sp,
              shadows: [
                BoxShadow(
                  color: const Color(0xffffffff).withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: const Offset(10, 10),
                ),
                BoxShadow(
                  color: const Color(0xffffffff).withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
                // shadow color 0xff00000 2% to the bottom side with more blur radius
                BoxShadow(
                  color: const Color(0xffffffff).withOpacity(0.2),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: const Offset(0, -10),
                ),
                // shadow color 0xff00000 2% to the left side with more blur radius
                BoxShadow(
                  color: const Color(0xffffffff).withOpacity(0.2),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: const Offset(-10, 0),

                ),
                BoxShadow(
                  color: const Color(0xffffffff).withOpacity(0.2),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: const Offset(10, 0),
                ),
                BoxShadow(
                  color: const Color(0xffffffff).withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: const Offset(12, -10),
                ),
                // shadow color 0xff00000 2% to the bottom side with more blur radius
                BoxShadow(
                  color: const Color(0xffffffff).withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
