import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/common_widget/lock_unlock_container.dart';
import 'package:test1/common_widget/setting_button.dart';
import 'package:test1/screen/unlock_screen.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: isExpanded?:LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff202327),
              Color(0xff000000),
              Color(0xff272727),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            settingButton(context),
            SizedBox(
              width: 244.w,
              height: 163.h,
              child: Image.asset('assets/images/black_car_image.png'),
            ),
            lockUnlockContainer(
              Icons.lock,
              'Unlock',
              () {
                HapticFeedback.mediumImpact();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UnlockScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
