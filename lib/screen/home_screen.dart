import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../models/home_providers.dart';

class HomeScreen extends StatelessWidget {
  final int currentScreen;

  const HomeScreen({super.key, required this.currentScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(builder: (context, watch, child) {
        watch.changeIndex = (currentScreen);
        return watch.currentScreen;
      }),
      bottomNavigationBar:
          Consumer<HomeProvider>(builder: (context, watch, child) {
        return Container(
          height: 78.h,
          width: 390.w,
          color: Colors.black,
          //padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ClipPath(
            clipper: BottomAppBarClipper(),
            child: Container(
              height: 78.h,
              width: 390.w,
              decoration: BoxDecoration(
                color: const Color(0xff18191b),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      watch.changeIndex=0;
                    },
                    icon: Icon(
                      Icons.home,
                      color: const Color(0xffEBEBF5).withOpacity(0.6),
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      watch.changeIndex=(1);
                    },
                    icon: Icon(
                      Icons.search,
                      color: const Color(0xffEBEBF5).withOpacity(0.6),
                      size: 30,
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
                      Icons.location_on_outlined,
                      color: const Color(0xffEBEBF5).withOpacity(0.6),
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      watch.changeIndex=(3);
                    },
                    icon: Icon(
                      Icons.person,
                      color: const Color(0xffEBEBF5).withOpacity(0.6),
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
      // floatingActionButton: Container(
      //   height: 72.h,
      //   width: 72.w,
      //   margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      //   padding: EdgeInsets.zero,
      //   child: ElevatedButton(
      //     onPressed: () {},
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: const Color(0xff18191b),
      //       shape: const CircleBorder(),
      //       elevation: 20,
      //     ),
      //     child: const Icon(
      //       Icons.add,
      //       size: 30,
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class BottomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final height = size.height;
    final width = size.width;
    //create a custom notch for the custom bottom nav bar
    // path.moveTo(0, 0);
    // path.lineTo(0, height);
    // how at the place width/2, and height i want to create a notch
    path.lineTo(width / 2 - 20, 0);
    path.lineTo(width / 2, 30);
    path.lineTo(width / 2+10, 20);
    path.lineTo(width / 2+20, 10);
    path.lineTo(width / 2+30, 0);
    path.lineTo(width / 2 + 20, height/2 - 10);
    path.lineTo(width / 2 + 30, 0);

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
