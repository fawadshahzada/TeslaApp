import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget lockUnlockContainer(IconData icon, String text, void Function() onPressed) {
  return Container(
    width: 178.w,
    height: 77.h,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(40.r),
      // shadow that goes inside the box making the child look shallower
      gradient: LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          Color(0xFF494c51).withOpacity(0.5),
          Color(0xFF2D2D2D).withOpacity(0.3),
        ],
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 62.h,
          width: 62.w,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
              ),
            ),
          ),
        ),
        // circular elevated button with shadow and setting icon
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(40.r),
            // shadow that goes inside the box making the child look shallower
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(-4, 0),
              ),
              // shadow inside the box
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                spreadRadius: 6,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          height: 72.h,
          width: 72.w,
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          padding: EdgeInsets.zero,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: const CircleBorder(),
              elevation: 20,
              splashFactory: NoSplash.splashFactory,
              shadowColor: Colors.white.withOpacity(0.3),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                icon,
                color: Color(0xff9EECD9).withOpacity(1),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
