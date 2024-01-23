import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/common_widget/setting_button.dart';

Widget lockUnlockContainer(IconData icon, String text, void Function() onPressed,context) {
  return Container(
    width: 178.w,
    height: 77.h,
    padding: const EdgeInsets.only(left: 20,),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(40.r),
      // shadow that goes inside the box making the child look shallower
      gradient: LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          const Color(0xFF494c51).withOpacity(0.5),
          const Color(0xFF2D2D2D).withOpacity(0.3),
        ],
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            width: 110.w,
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
        ),
        // circular elevated button with shadow and setting icon
        Expanded(
          flex: 2,
            child: settingButton(context, icon, onPressed))
      ],
    ),
  );
}
