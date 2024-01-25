import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmorphism/glassmorphism.dart';

Widget settingButton(BuildContext context, IconData icon,VoidCallback onPressed) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40.r),
      boxShadow: [
        BoxShadow(
          offset: const Offset(-3,-1),
          blurRadius: 15,
          spreadRadius: 4,
          color: Colors.white.withOpacity(0.1),
        ),
        BoxShadow(
          offset: const Offset(12,12),
          blurRadius: 15,
          spreadRadius: 6,
          color: Colors.black.withOpacity(0.2),
        ),
      ],
    ),
    child: GlassmorphicContainer(
      width: 50.w,
      height: 50.h,
      borderRadius: 40.r,
      blur: 17,
      alignment: Alignment.center,
      border: 1.5,
      linearGradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xffFFFFFF).withOpacity(0.1),
          const Color(0xffFFFFFF).withOpacity(0.01),
          //const Color(0xff000000).withOpacity(0.01),
          const Color(0xff000000).withOpacity(0.01),
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
          color: Colors.white,
          size: 25.r,
        ),
      ),
    ),
  );
}

Widget containerSettingButton(BuildContext context, IconData icon,VoidCallback onPressed) {
  return Container(
    height: 55.h,
    width: 55.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.r),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0,-5),
          blurRadius: 30,
          spreadRadius: 0,
          color: Colors.white.withOpacity(0.1),
        ),
      ],
    ),
    child: GlassmorphicContainer(
      width: 55.w,
      height: 55.h,
      borderRadius: 100.r,
      blur: 0,
      alignment: Alignment.center,
      border: 1.5,
      linearGradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xffFFFFFF).withOpacity(0.001),
          const Color(0xffFFFFFF).withOpacity(0.01),
          const Color(0xff000000).withOpacity(0.01),
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
          const Color(0xff000000).withOpacity(0.4),
          const Color(0xff000000).withOpacity(0.4),
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
          color: icon==FontAwesomeIcons.lockOpen?const Color(0xff2FB8FF).withOpacity(1):Colors.white,
          size: 21,
          fill: 0.5,
        ),
      ),
    ),
  );
}
