import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/common_widget/setting_button.dart';

import '../common_widget/custom_appbar.dart';
import '../repository/nearby_chargers_list.dart';

class ChargingScreen extends StatefulWidget {
  const ChargingScreen({super.key});

  @override
  State<ChargingScreen> createState() => _ChargingScreenState();
}

class _ChargingScreenState extends State<ChargingScreen>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          // adding gradient, where top center is light, center is lighter and bottom is dark
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff282a2f),
                Color(0xff28343b),
                Color(0xff18191b),
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              customAppBar(context,'CHARGING'),
              // animated image and container size
              SizedBox(
                height: 350.h,
                width: 382.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                      'assets/images/charging_screen_images/white_sided_car.png',
                      height: 221.h,
                      width: 382.w,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 170.h,
                      child: SizedBox(
                        height: 199.h,
                        width: 330.w,
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '65',
                                    style: TextStyle(
                                      color: const Color(0xffFFFFFF),
                                      fontSize: 34.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    '%',
                                    style: TextStyle(
                                      color: const Color(0xffEBEBF5)
                                          .withOpacity(0.6),
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 225.h,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateX(-0.8)
                          ..rotateZ(0.0)
                          ..rotateY(0.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color(0xffEBEBF5).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Container(
                            height: 55.h,
                            width: 274.w,
                            decoration: BoxDecoration(
                              color: const Color(0xff58cbf1).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(0),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xffFFFFFF).withOpacity(0.6),
                                  const Color(0xffFFFFFF).withOpacity(0),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 255.h,
                      right: 45.w,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateX(-0.0)
                          ..rotateZ(0.0)
                          ..rotateY(0.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color(0xffEBEBF5).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Container(
                            height: 12.h,
                            width: 286.w,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff).withOpacity(0.05),
                              borderRadius: BorderRadius.circular(0),
                              //linear gradient from top to bottom
                              //#76AA6E 100%
                              // #204A25 100%
                              // #1E4B20 100%
                              // #3B8527 100%
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xffffffff).withOpacity(0.5),
                                ),
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xffFFFFFF).withOpacity(0.6),
                                  const Color(0xffFFFFFF).withOpacity(0),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 215.h,
                      left: 53.w,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateX(-0.8)
                          ..rotateZ(0.0)
                          ..rotateY(0.0),
                        alignment: FractionalOffset.center,
                        child: Container(
                          height: 55.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                              color: const Color(0xff58cbf1).withOpacity(1),
                              borderRadius: BorderRadius.circular(0),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff5dcef0),
                                  Color(0xff87e1e1),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff58cbf1).withOpacity(0.1),
                                  spreadRadius: 20,
                                  blurRadius: 30,
                                  offset: const Offset(0, -40),
                                ),
                                BoxShadow(
                                  color:
                                      const Color(0xff58cbf1).withOpacity(0.4),
                                  spreadRadius: 20,
                                  blurRadius: 20,
                                  offset: const Offset(10, -20),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 255.h,
                      left: 52.w,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateX(-0.0)
                          ..rotateZ(0.0)
                          ..rotateY(0.0),
                        alignment: FractionalOffset.center,
                        child: Container(
                          height: 12.h,
                          width: 202.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff).withOpacity(1),
                            borderRadius: BorderRadius.circular(0),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff5dcef0),
                                Color(0xff5dcef0),
                                Color(0xff87e1e1),
                                Color(0xff87e1e1),
                                Color(0xff87e1e1),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 270.h,
                      right: 60.w,
                      child: Row(
                        children: [
                          Container(
                            height: 10.h,
                            width: 3.w,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff2FB8FF),
                                  Color(0xff9EECD9),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          SizedBox(
                            width: 60.w,
                          ),
                          Container(
                            height: 10.h,
                            width: 3.w,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff2FB8FF),
                                  Color(0xff9EECD9),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 282.h,
                      right: 50.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                              height: 27.h,
                              width: 50.w,
                              child: Column(
                                children: [
                                  Text(
                                    '75%',
                                    style: TextStyle(
                                        color: const Color(0xffFFFFFF),
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'SfProRegular'),
                                  ),
                                ],
                              )),
                          SizedBox(
                            width: 10.w,
                          ),
                          SizedBox(
                              height: 27.h,
                              width: 50.w,
                              child: Column(
                                children: [
                                  Text(
                                    '100%',
                                    style: TextStyle(
                                        color: const Color(0xffFFFFFF),
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'SfProRegular'),
                                  ),
                                ],
                              )),
                          SizedBox(
                            width: 10.w,
                          ),
                        ],
                      ),
                    ),
                    // sliding stick
                    Positioned(
                      top: 315.h,
                      left: 53.w,
                      child: Container(
                        height: 9.h,
                        width: 273.w,
                        decoration: BoxDecoration(
                          color: const Color(0xff242528).withOpacity(0.7),
                          borderRadius: BorderRadius.circular(0),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xff000000).withOpacity(0.8),
                              const Color(0xffFFFFFF).withOpacity(0.08),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // set charge limit text
                    Positioned(
                      top: 330.h,
                      child: SizedBox(
                        height: 27.h,
                        width: 330.w,
                        child: Center(
                          child: Text(
                            'Set Charge Limit',
                            style: TextStyle(
                                color: const Color(0xffEBEBF5).withOpacity(0.6),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'SfProRegular'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 41.h,
              ),
              Material(
                color: Colors.transparent,
                elevation: 5,
                shadowColor: Colors.black.withOpacity(0.1),
                child: Container(
                  height: isExpanded ? 314.h : 130.h,
                  decoration: BoxDecoration(
                    color: const Color(0xff202122).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(40.r),
                    border: Border.lerp(
                      //top and left should be black and the rest should be white
                      Border(
                        top: BorderSide(
                          color: Colors.black.withOpacity(0.1),
                          width: 1,
                        ),
                        left: BorderSide(
                          color: Colors.black.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      Border(
                        top: BorderSide(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                        left: BorderSide(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      0.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(4, 8),
                        blurRadius: 5,
                        spreadRadius: -20,
                        color: Colors.black.withOpacity(0.2),
                        inset: true,
                      ),
                      BoxShadow(
                        offset: const Offset(4, 8),
                        blurRadius: 10,
                        spreadRadius: -5,
                        color: Colors.black.withOpacity(0.4),
                        inset: true,
                      ),

                    ],
                  ),
                  child: Container(
                    height: isExpanded ? 304.h : 120.h,
                    width: 338.w,
                    decoration: BoxDecoration(
                      color: const Color(0xff202122).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(40.r),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.1),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, -4),
                          color: const Color(0xff000000).withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 90.h,
                            width: 297.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Nearby Superchargers',
                                  style: TextStyle(
                                      color: const Color(0xffFFFFFF),
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'SfProRegular'),
                                ),
                                settingButton(
                                    context,
                                    isExpanded
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down_sharp, () {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: isExpanded ? 10.h : 0.h,
                          ),
                          SizedBox(
                            height: isExpanded ? 175.h : 0.h,
                            width: 297.w,
                            child: ListView(
                              children: [
                                ListTile(
                                  title: Text(
                                    'Tesla Supercharger -',
                                    style: TextStyle(
                                      color: const Color(0xffEBEBF5)
                                          .withOpacity(0.6),
                                    ),
                                  ),
                                  subtitle: Text(
                                    'Montreal, QC\n 2 / 4 available',
                                    style: TextStyle(
                                      color: const Color(0xffEBEBF5)
                                          .withOpacity(0.6),
                                    ),
                                  ),
                                  isThreeLine: true,
                                  trailing: tailingCommon(),
                                ),
                                SizedBox(height: 10.h),
                                ListTile(
                                  title: Text(
                                    'Tesla Supercharger -',
                                    style: TextStyle(
                                      color: const Color(0xffEBEBF5)
                                          .withOpacity(0.6),
                                    ),
                                  ),
                                  subtitle: Text(
                                    'Montreal, QC\n 2 / 4 available',
                                    style: TextStyle(
                                      color: const Color(0xffEBEBF5)
                                          .withOpacity(0.6),
                                    ),
                                  ),
                                  isThreeLine: true,
                                  trailing: tailingCommon(),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
