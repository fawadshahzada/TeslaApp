import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/screen/setting_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: const SettingScreen(),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 0,
        color: const Color(0xff000000).withOpacity(1),
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 78.h,
          width: 390.w,
          decoration: const BoxDecoration(
            // top left and right corner should be sharply rounded
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  color: Color(0xffEBEBF5).withOpacity(0.6),
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Color(0xffEBEBF5).withOpacity(0.6),
                  size: 30,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Color(0xffEBEBF5).withOpacity(0.6),
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  color: Color(0xffEBEBF5).withOpacity(0.6),
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 72.h,
        width: 72.w,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
        padding: EdgeInsets.zero,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff18191b),
            shape: const CircleBorder(),
            elevation: 10,
          ),
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}
