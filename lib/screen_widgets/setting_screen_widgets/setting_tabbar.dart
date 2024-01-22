import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test1/screen/look_screen.dart';

import '../../models/home_providers.dart';

Widget settingTabBar(BuildContext context) {
  Color selectedColor = const Color(0xffEBEBF5).withOpacity(0.6);
  Color unselectedColor = const Color(0xffEBEBF5).withOpacity(0.3);
  var homeProvider  = Provider.of<HomeProvider>(context);
  return Material(
    borderRadius: BorderRadius.circular(50.r),
    elevation: 30,
    color: Colors.transparent,
    child: Container(
      height: 74.h,
      width: 330.w,
      decoration: BoxDecoration(
        color: const Color(0xff27282A),
        borderRadius: BorderRadius.circular(50.r),
        // shadow that goes inside the box making the child look shallower
        boxShadow: [
          // shadow color 0xff00000 2% to the top side with more blur radius
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
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 4 Icon Buttons
          IconButton(
            onPressed: () {
              //navigate to the homeScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LockScreen();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.lock,
              color: unselectedColor,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              homeProvider.changeIndex = 2;

            },
            icon: Icon(
              FontAwesomeIcons.fan,
              color: unselectedColor,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              //navigate to the homeScreen
              homeProvider.changeIndex = 1;

            },
            icon: Icon(
              Icons.electric_bolt_sharp,
              color: unselectedColor,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              //navigate to the homeScreen
             homeProvider.changeIndex = 0;
            },
            icon: Icon(
              FontAwesomeIcons.carSide,
              color: selectedColor,
              size: 24,
            ),
          ),
        ],
      ),
    ),
  );
}
