import 'package:flutter/cupertino.dart'hide BoxDecoration, BoxShadow;
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import '../models/home_providers.dart';

class HomeScreen extends StatelessWidget {
  final int currentScreen;

  const HomeScreen({super.key, required this.currentScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Consumer<HomeProvider>(builder: (context, watch, child) {
            watch.changeIndex = (currentScreen);
            return watch.currentScreen;
          }),
    Align(
      alignment: Alignment.bottomCenter,
      child: Consumer<HomeProvider>(builder: (context, watch, child) {
        return ClipPath(
              clipper: BottomAppBarClipper(),
              child: Container(
                height: 78.h,
                width: 390.w,
                decoration: BoxDecoration(
                  color: const Color(0xff18191b),
                  // border top layer color
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                  border: Border.all(
                    color: const Color(0xff000000).withOpacity(0.4),
                    width: 0.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff000000).withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        watch.changeIndex=0;
                      },
                      icon: Icon(
                        CupertinoIcons.car_detailed,
                        color: const Color(0xffEBEBF5).withOpacity(0.6),
                        size: 30.r,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        watch.changeIndex=(1);
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
                      onPressed: () {
                        watch.changeIndex=(2);
                      },
                      icon: Icon(
                        CupertinoIcons.location_fill,
                        color: const Color(0xffEBEBF5).withOpacity(0.6),
                        size: 28.r,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        watch.changeIndex=(3);
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
            );},),
    ),
          Positioned(
            bottom: 55.h,
            right: 133.w,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff000000).withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 0),
                    inset: false,
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff18191b),
                  shape: const CircleBorder(),
                  elevation: 50,
                ),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    // make the icon color white and grey
                    return LinearGradient(
                      colors: <Color>[
                        Color(0xff9EECD9).withOpacity(.9),
                        Color(0xff9EECD9).withOpacity(.4),
                      ],
                      stops: <double>[0.0, 1.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(
                      Icons.add,
                      size: 40.r,
                    ),
                  ),
                ),
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
    final height = size.height;
    final width = size.width;
    // smooth transition to the following cut using quadratic bezier
    path.moveTo(0,35.2235);
    path.cubicTo(0,31.8714,1.29483,28.6489,3.61415,26.2287);
    path.lineTo(16.3492,12.94);
    path.cubicTo(24.2708,4.67391,35.2237,0,46.6727,0);

    // how at the place width/2, and height i want to create a notch
    path.lineTo(width / 2 - 45, 0);
    final firstPoint = Offset(width / 2 - 45, 0);
    final secondPoint = Offset(width / 2, height / 2 + 20);
    final thirdPoint = Offset(width / 2 + 45, 0);
    path.cubicTo(firstPoint.dx, firstPoint.dy, secondPoint.dx, secondPoint.dy,
        thirdPoint.dx, thirdPoint.dy);
    // cut to the right border
    path.lineTo(width - width / 12, 0);
    path.lineTo(width, height / 2 - 15);

    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
