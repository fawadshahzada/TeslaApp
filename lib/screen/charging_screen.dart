import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/common_widget/setting_button.dart';
import 'package:test1/screen_widgets/setting_screen_widgets/inner_shadow.dart';

class ChargingScreen extends StatelessWidget {
  const ChargingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          // adding gradient, where top center is light, center is lighter and bottom is dark
          decoration: BoxDecoration(
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
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //back button
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: const Color(0xffEBEBF5).withOpacity(0.6),
                      size: 30,
                    ),
                  ),
                  const Text(
                    'Charging',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // setting button
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: const Color(0xffEBEBF5).withOpacity(0.6),
                      size: 30,
                    ),
                  ),
                ],
              ),
              // animated image and container size
              SizedBox(
                height: 380.h,
                width: 382.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/charging_screen_images/white_sided_car.png',
                    ),
                    Positioned(
                      top: 230.h,
                      child: SizedBox(
                        height: 199.h,
                        width: 330.w,
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                '65%',
                                style: TextStyle(
                                  color: const Color(0xffFFFFFF),
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 270.h,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xffEBEBF5).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Container(
                          height: 39.h,
                          width: 274.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffEBEBF5).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(0),
                            //linear gradient from top to bottom
                            //#76AA6E 100%
                            // #204A25 100%
                            // #1E4B20 100%
                            // #3B8527 100%
      
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
                    Positioned(
                      top: 270.h,
                      left: 53.w,
                      child: Container(
                        height: 39.h,
                        width: 100.w,
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
                        ),
                      ),
                    ),
                    Positioned(
                      top: 315.h,
                      right: 60.w,
                      child: Row(
                        children: [
                          Container(
                              height: 8.h,
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
                          SizedBox(width: 60.w,),
                          Container(
                              height: 8.h,
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
                      top: 315.h,
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
                                    fontFamily: 'SfProRegular'
                                  ),
                                ),
                              ],
                            )
                          ),
                          SizedBox(width: 10.w,),
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
                                    fontFamily: 'SfProRegular'
                                  ),
                                ),
                              ],
                            )
                          ),
                          SizedBox(width: 10.w,),
                        ],
                      ),
                    ),
                    // sliding stick
                    Positioned(
                      top: 345.h,
                      left: 53.w,
                      child: Container(
                        height: 5.h,
                        width: 273.w,
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
                        ),
                      ),
                    ),
                    // set charge limit text
                    Positioned(
                      top: 360.h,
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
                              fontFamily: 'SfProRegular'
                            ),
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
                elevation: 0,
                child: Container(
                  height: 130.h,
                  width: 338.w,
                  decoration: BoxDecoration(
                    color: const Color(0xff202122).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(40.r),
                    border: Border.all(
                      color:Colors.black.withOpacity(0.1),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.02),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Nearby Superchargers',style: TextStyle(
                          color: const Color(0xffFFFFFF),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SfProRegular'
                        ),),
                        settingButton(context),
                      ],
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
