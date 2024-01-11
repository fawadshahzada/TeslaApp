import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/common_widget/lock_unlock_container.dart';
import 'package:test1/common_widget/setting_button.dart';

class UnlockScreen extends StatefulWidget {
  const UnlockScreen({super.key});

  @override
  State<UnlockScreen> createState() => _UnlockScreenState();
}

class _UnlockScreenState extends State<UnlockScreen>
    with SingleTickerProviderStateMixin {
  // init animation controller for the image and image container size
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 150, end: 300).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 64.h,
            ),
            settingButton(context),
            // animated image and container size
            SizedBox(
              height: 39.h,
            ),
            SizedBox(
              height: 320.h,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 50.h),
                      child: Align(
                        alignment: Alignment(
                          0.0,
                          -(_animation.value - 50) / (250 - 100),
                        ),
                        // animated positioning text which are model 3
                        child: Text(
                          'Model 3',
                          style: TextStyle(
                            color: Colors.white.withOpacity(
                              1 - (100 - 50) / (100),
                            ),
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50.h,
                    child: Container(
                      height: _animation.value,
                      width: 407.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/unlock_car.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: lockUnlockContainer(
                Icons.lock_open_rounded,
                'Lock',
                () {
                  HapticFeedback.mediumImpact();
                  //navigate to lock screen
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 90.h,
            ),
          ],
        ),
      ),
    );
  }
}
