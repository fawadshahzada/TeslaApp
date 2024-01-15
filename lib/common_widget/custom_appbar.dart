import 'package:flutter/material.dart';
import 'package:test1/common_widget/setting_button.dart';

Row customAppBar(BuildContext context,String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      //back button
      settingButton(context, Icons.arrow_back_ios_new, () {
        Navigator.pop(context);
      }),
      Text(
        text,
        style: const TextStyle(
          color: Color(0xffFFFFFF),
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
      ),
      // setting button
      settingButton(
        context,
        Icons.settings,
            () {
          Navigator.pop(context);
        },
      ),
    ],
  );
}