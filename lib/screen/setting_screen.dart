import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test1/classes/list_tile_class.dart';
import 'package:test1/common_widget/setting_button.dart';
import 'package:test1/screen_widgets/setting_screen_widgets/setting_tabbar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff202327),
                Color(0xff292C31),
                Color(0xff272727),
                Color(0xff272727),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 2),
                  child: ListTile(
                    title: Text('Tesla',
                        style: TextStyle(
                          color: const Color(0xffFFFFFF),
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                        )),
                    onTap: () {},
                    subtitle: Row(
                      children: [
                        // battery icon and 187 Km
                        Icon(
                          FontAwesomeIcons.batteryHalf,
                          color: const Color(0xffEBEBF5).withOpacity(0.3),
                          size: 17.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          '187 Km',
                          style: TextStyle(
                            color: const Color(0xffEBEBF5).withOpacity(0.3),
                            fontSize: 17.sp,
                          ),
                        ),
                      ],
                    ),
                    // in the trailing i want to add a circular container with a person icon
                    trailing: settingButton(context, Icons.person, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingScreen()
                        ));
                      }),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 254.h,
                  width: 387.w,
                  child: Image.asset(
                    'assets/images/setting_screen_images/main_car_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                settingTabBar(context),
                SizedBox(
                  height: 55.h,
                ),
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50.r),
                  elevation: 30,
                  child: Container(
                    width: 330.w,
                    height: 500.h,
                    padding: EdgeInsets.only(top: 30.h,bottom: 20.h,left: 25.w,right: 15.w),
                    decoration: BoxDecoration(
                      color: const Color(0xff27282A),
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(
                        color: const Color(0x00ffffff).withOpacity(0.1),
                        width: 1.5.w,
                      ),
                      // shadow that goes inside the box making the child look shallower
                      boxShadow: [
                        // shadow color 0xff00000 2% to the top side with more blur radius
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 20,
                          blurRadius: 20,
                          offset: const Offset(10, -10),
                        ),
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
                      ],
                    ),
                    child: ListView.builder(
                        itemCount: listTiles.length,
                        itemBuilder: (context, index) {
                          return listTiles[index];
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
