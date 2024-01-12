import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screen/home_screen.dart';

Widget settingButton(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(right: 0.0.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 62.w,
              height: 62.h,
              decoration: BoxDecoration(
                color: const Color(0xFF232629),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF545659).withOpacity(0.1),
                    offset: const Offset(8, 8),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(63),
              child: Container(
                width: 62.w,
                height: 62.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF232629),
                      offset: Offset(3, 3),
                      blurRadius: 3,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    //navigate to the homeScreen
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                    }));
                  },
                  icon: Icon(
                    Icons.settings,
                    color: const Color(0xffEBEBF5).withOpacity(0.6),
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
