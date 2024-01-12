import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/screen/setting_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SettingScreen(),
      // bottomNavigationBar: Container(
      //   height: 78.h,
      //   width: 390.w,
      //   decoration: const BoxDecoration(
      //     color: Colors.transparent,
      //     // top left and right corner should be sharply rounded
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(0),
      //       topRight: Radius.circular(0),
      //     ),
      //     // make the box color transparent
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.transparent,
      //         spreadRadius: 0,
      //         blurRadius: 0,
      //         offset: Offset(0, 0),
      //       ),
      //     ],
      //   ),
      //   child: ClipPath(
      //    // clipper: BottomAppBarClipper(),
      //     child: Container(
      //       height: 78.h,
      //       width: 390.w,
      //       decoration: BoxDecoration(
      //         // top left and right corner should be sharply rounded
      //         borderRadius: BorderRadius.all(
      //           Radius.circular(100.r),
      //         ),
      //         color: Colors.green,
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           IconButton(
      //             onPressed: () {},
      //             icon: Icon(
      //               Icons.home,
      //               color: const Color(0xffEBEBF5).withOpacity(0.6),
      //               size: 30,
      //             ),
      //           ),
      //           IconButton(
      //             onPressed: () {},
      //             icon: Icon(
      //               Icons.search,
      //               color: const Color(0xffEBEBF5).withOpacity(0.6),
      //               size: 30,
      //             ),
      //           ),
      //           const Spacer(),
      //           IconButton(
      //             onPressed: () {},
      //             icon: Icon(
      //               Icons.notifications,
      //               color: const Color(0xffEBEBF5).withOpacity(0.6),
      //               size: 30,
      //             ),
      //           ),
      //           IconButton(
      //             onPressed: () {},
      //             icon: Icon(
      //               Icons.person,
      //               color: const Color(0xffEBEBF5).withOpacity(0.6),
      //               size: 30,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
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
      //       elevation: 10,
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
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(0, size.height / 2.5);
    var firstEnd = Offset(size.width, size.height);
    path.quadraticBezierTo(firstEnd.dx, firstEnd.dy, firstStart.dx, firstStart.dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
