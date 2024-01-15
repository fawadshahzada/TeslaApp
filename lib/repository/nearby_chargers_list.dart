import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<ListTile> nearbyChargers = [
  ListTile(
    title: Text(
      'Tesla Supercharger -',
      style: TextStyle(
        color: const Color(0xffEBEBF5).withOpacity(0.6),
      ),
    ),
    subtitle: Text('Montreal, QC\n 2 / 4 available',style: TextStyle(
      color: const Color(0xffEBEBF5).withOpacity(0.6),
    ),),
    isThreeLine: true,
    trailing: tailingCommon(),
  ),

  ListTile(
    title: Text(
      'Tesla Supercharger -',
      style: TextStyle(
        color: const Color(0xffEBEBF5).withOpacity(0.6),
      ),
    ),
    subtitle: Text('Montreal, QC\n 2 / 4 available',style: TextStyle(
      color: const Color(0xffEBEBF5).withOpacity(0.6),
    ),),
    isThreeLine: true,
    trailing: tailingCommon(),
  ),

  ListTile(
    title: Text(
      'Tesla Supercharger -',
      style: TextStyle(
        color: const Color(0xffEBEBF5).withOpacity(0.6),
      ),
    ),
    subtitle: Text('Montreal, QC\n 2 / 4 available',style: TextStyle(
      color: const Color(0xffEBEBF5).withOpacity(0.6),
    ),),
    isThreeLine: true,
    trailing: tailingCommon(),
  ),

  ListTile(
    title: Text(
      'Tesla Supercharger -',
      style: TextStyle(
        color: const Color(0xffEBEBF5).withOpacity(0.6),
      ),
    ),
    subtitle: Text('Montreal, QC\n 2 / 4 available',style: TextStyle(
      color: const Color(0xffEBEBF5).withOpacity(0.6),
    ),),
    isThreeLine: true,
    trailing: tailingCommon(),
  ),
];

Widget tailingCommon() {
  return Column(
    children: [
      Container(
        height: 34.h,
        width: 34.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: const Image(
          image: AssetImage(
              'assets/images/charging_screen_images/charger_icon.png'),
        ),
      ),
      Text(
        '1.7',
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'SfProRegular',
        ),
      ),
    ],
  );
}
