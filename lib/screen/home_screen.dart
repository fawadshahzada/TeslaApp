import 'package:flutter/cupertino.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import 'package:test1/screen/charging_screen.dart';
import 'package:test1/screen/climate_screen.dart';
import 'package:test1/screen/setting_screen.dart';
import '../models/home_providers.dart';
import 'look_screen.dart';


class HomeScreen extends StatelessWidget {
  final int currentScreen;

  const HomeScreen({super.key, required this.currentScreen});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const SettingScreen(),
      const ChargingScreen(),
      const ClimateScreen(),
      const LockScreen(),
    ];
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: screens.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Consumer<HomeProvider>(
                builder: (context, watch, child) {
                  return screens[watch.currentIndex];
                },
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Consumer<HomeProvider>(
              builder: (context, watch, child) {
                return ClipPath(
                  clipper: BottomAppBarClipper(),
                  child: GlassmorphicContainer(
                    height: 78.h,
                    width: double.maxFinite,
                    borderRadius: 10.r,
                    blur: 10,
                    alignment: Alignment.center,
                    border: 2,
                    borderGradient: LinearGradient(
                      colors: [
                        const Color(0xffFFFFFF).withOpacity(0.1),
                        const Color(0xffFFFFFF).withOpacity(0.05),
                      ],
                    ),
                    linearGradient: LinearGradient(
                      colors: [
                        const Color(0xffFFFFFF).withOpacity(0.07),
                        const Color(0xff000000).withOpacity(0.05),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          highlightColor: const Color(0xff4d8599),
                          onPressed: () {
                            watch.changeIndex = 0;
                          },
                          icon: Icon(
                            CupertinoIcons.car_detailed,
                            color: const Color(0xffEBEBF5).withOpacity(0.6),
                            size: 30.r,
                          ),
                        ),
                        IconButton(
                          highlightColor: const Color(0xff4d8599),
                          onPressed: () {
                            watch.changeIndex = (1);
                          },
                          icon: Icon(
                            Icons.electric_bolt,
                            color: const Color(0xffEBEBF5).withOpacity(0.6),
                            size: 30.r,
                          ),
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                        IconButton(
                          highlightColor: const Color(0xff4d8599),
                          splashRadius: 40.r,
                          onPressed: () {
                            watch.changeIndex = (2);
                          },
                          icon: Icon(
                            CupertinoIcons.location_fill,
                            color: const Color(0xffEBEBF5).withOpacity(0.6),
                            size: 28.r,
                          ),
                        ),
                        IconButton(
                          highlightColor: const Color(0xff4d8599),
                          onPressed: () {
                            // navigate to the lock screen
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const LockScreen()), (route) => false);
                          },
                          icon: Icon(
                            Icons.person,
                            color: const Color(0xffEBEBF5).withOpacity(0.6),
                            size: 30.r,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 65.h,
            right: 155.w,
            child: GlassmorphicContainer(
              height: 80.h,
              width: 80.w,
              borderRadius: 45.r,
              blur:20,
              border: 1,
              borderGradient: LinearGradient(
                colors: [
                  const Color(0xffFFFFFF).withOpacity(0.1),
                  const Color(0xffFFFFFF).withOpacity(0.05),
                ],
              ),
              linearGradient: LinearGradient(
                colors: [
                  const Color(0xffFFFFFF).withOpacity(0.01),
                  const Color(0xff000000).withOpacity(0.05),
                ],
                stops: const [
                  0.1,
                  1,
                ],
              ),

              child: Stack(
                children: [
                  Positioned(
                    top: 14.h,
                    left: -7.w,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.transparent,
                        shape: const CircleBorder(),
                        elevation: 0,
                      ),
                      child: Center(
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              colors: [
                                Color(0xff2FB8FF),
                                Color(0xff9EECD9),
                              ],
                              tileMode: TileMode.clamp,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(bounds);
                          },
                          child: Icon(
                            Icons.add,
                            size: 50.r,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

  class BottomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // smooth transition to the following cut using quadratic bezier
    path.moveTo(0, 35.2235.h);
    path.cubicTo(0, 31.8714.h, 1.29483.w, 28.6489.h, 3.61415.w, 26.2287.h);
    path.lineTo(16.3492.w, 12.94.h);
    path.cubicTo(24.2708.w, 4.67391.h, 35.2237.w, 0, 46.6727.w, 0);
    path.lineTo(124.328.w, 0);
    path.cubicTo(132.903.w, 0, 141.273.w, 2.62492.h, 148.313.w, 7.52198.h);
    path.lineTo(169.302.w, 22.1232.h);
    path.cubicTo(
        184.749.w, 32.8689.h, 205.251.w, 32.8689.h, 220.698.w, 22.1232.h);
    path.lineTo(241.687.w, 7.52198.h);
    path.cubicTo(248.727.w, 2.62491.h, 257.097.w, 0, 265.672.w, 0);
    path.lineTo(343.327.w, 0);
    path.cubicTo(354.776.w, 0, 365.729.w, 4.67391.h, 373.651.w, 12.94.h);
    path.lineTo(386.386.w, 26.2287.h);
    path.cubicTo(388.705.w, 28.6489.h, 390.w, 31.8714.h, 390.w, 35.2235.h);
    path.lineTo(390.w, 78.h);
    path.lineTo(0, 78.h);
    path.lineTo(0, 35.2235.h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
