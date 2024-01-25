import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:test1/common_widget/setting_button.dart';

Widget lockUnlockContainer(
    IconData icon, String text, void Function() onPressed, context) {
  return GlassmorphicContainer(
    width: 178.w,
    height: 92.h,
    borderRadius: 40.r,
    blur: 17,
    alignment: Alignment.center,
    border:3.0,
    linearGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xff000000).withOpacity(0.01),
        const Color(0xff000000).withOpacity(0.01),
        const Color(0xffFFFFFF).withOpacity(0.01),
        //const Color(0xff000000).withOpacity(0.01),
      ],
      stops: const [
        0.1,
        0.5,
        1,
      ],
    ),
    borderGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xff000000).withOpacity(0.1),
        const Color(0xff000000).withOpacity(0.1),
        const Color(0xffffffff).withOpacity(0.08),
        const Color(0xffffffff).withOpacity(0.08),
      ],
      stops: const [
        0.0,
        0.05,
        0.5,
        1,
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
                fontFamily: 'SfProBold',
              ),
            ),
          ),
        ),
        // circular elevated button with shadow and setting icon
        Expanded(
          flex: 2,
          child: containerSettingButton(
            context,
            icon,
            onPressed,
          ),
        )
      ],
    ),
  );
}
