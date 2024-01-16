import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/common_widget/lock_unlock_container.dart';
import 'package:test1/common_widget/setting_button.dart';
import 'package:test1/screen/home_screen.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = Tween<double>(begin: 150, end: 300).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: isExpanded
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff282a2f),
                      Color(0xff28343b),
                      Color(0xff18191b),
                    ],
                  )
                : const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff202327),
                      Color(0xff000000),
                      Color(0xff000000),
                      Color(0xff272727),
                    ],
                  ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 250.w),
                  child: settingButton(context, Icons.settings, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen(
                                  currentScreen: 0,
                                )));
                  })),
              isExpanded
                  ? SizedBox(
                      height: 400.h,
                      width: double.maxFinite,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            child: Align(
                              alignment: Alignment(
                                0.0,
                                -(_animation.value - 67) / (322 - 100),
                              ),
                              // animated positioning text which are model 3
                              child: Text(
                                'Model 3',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'SfProBold',
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 55.h,
                            child: Container(
                              height: _animation.value,
                              width: 500.w,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/white_car.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      width: 244.w,
                      height: 400.h,
                      child: Image.asset('assets/images/black_car_image.png'),
                    ),
              lockUnlockContainer(
                isExpanded ? Icons.lock_open_rounded : Icons.lock,
                isExpanded ? 'Lock' : 'Unlock',
                () {
                  // make the value equal to 0
                  _controller.reset();
                  HapticFeedback.lightImpact();
                  _controller.forward();
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
