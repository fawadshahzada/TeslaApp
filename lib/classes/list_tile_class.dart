import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


List<ListTile> listTiles=[
  ListTile(
    title: titleText('Control'),
    onTap: () {},
    leading: const Icon(FontAwesomeIcons.car),
    trailing: IconButton(
      onPressed: () {},
      icon:Icon(Icons.arrow_forward_ios,size: 20.sp),
    ),
  ),
  ListTile(
    title: titleText('Climate'),
    onTap: () {},
    subtitle: subTitleText('Interior 20°C'),
    leading: const Icon(Icons.looks),
    trailing: IconButton(
      onPressed: () {},
      icon:Icon(Icons.arrow_forward_ios,size: 20.sp),
    ),

  ),
  ListTile(
    // making the trailing iconbutton align to the right
    title: titleText('Location'),
    onTap: () {},
    subtitle: subTitleText('Palo Alto, CA'),
    leading: const Icon(Icons.lock_open),
    trailing: IconButton(
      onPressed: () {},
      icon:Icon(Icons.arrow_forward_ios,size: 20.sp),
    ),
  ),
  ListTile(
    title: titleText('Software'),
    onTap: () {},
    subtitle: subTitleText('2020.48.35.5'),
    leading: const Icon(Icons.settings),
    trailing: IconButton(
      onPressed: () {},
      icon:Icon(Icons.arrow_forward_ios,size: 20.sp),
    ),
  ),
  ListTile(
    title: titleText('Account'),
    onTap: () {},
    leading: const Icon(Icons.account_circle),
    trailing: IconButton(
      onPressed: () {},
      icon:Icon(Icons.arrow_forward_ios,size: 20.sp),
    ),
  ),
  ListTile(
    title: titleText('Help'),
    onTap: () {},
    leading: const Icon(Icons.help),
    trailing: IconButton(
      onPressed: () {},
      icon:Icon(Icons.arrow_forward_ios,size: 20.sp),
    ),
  ),
  ListTile(
    title: titleText('Open Source Licenses'),
    onTap: () {},
    leading: const Icon(Icons.info),
    trailing: IconButton(
      onPressed: () {},
      icon:Icon(Icons.arrow_forward_ios,size: 20.sp),
    ),
  ),
];

Widget titleText(String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        color: const Color(0xffEBEBF5).withOpacity(0.6),
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'SfProBold',
        letterSpacing: 0.38,
      ),
    ),
  );
}

Widget subTitleText(String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        color: const Color(0xffEBEBF5).withOpacity(0.3),
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'SfProRegular',
        letterSpacing: 0.41,
      ),
    ),
  );
}