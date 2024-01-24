import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test1/common_widget/setting_button.dart';
import 'package:test1/models/charging_provider.dart';
import 'dart:ui' as ui;
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
          // adding gradient, where top center is light,
          // center is lighter and bottom is dark
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff282a2f),
                Color(0xff28343b),
                Color(0xff18191b),
                Color(0xff18191b),
                Color(0xff18191b),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                customAppBar(context, 'CHARGING'),
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
                                      textAlign: TextAlign.center,
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
                                color:
                                    const Color(0xffffffff).withOpacity(0.05),
                                borderRadius: BorderRadius.circular(0),
                                //linear gradient from top to bottom
                                //#76AA6E 100%
                                // #204A25 100%
                                // #1E4B20 100%
                                // #3B8527 100%
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xffffffff)
                                        .withOpacity(0.5),
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
                                    color: const Color(0xff58cbf1)
                                        .withOpacity(0.1),
                                    spreadRadius: 20,
                                    blurRadius: 30,
                                    offset: const Offset(0, -40),
                                  ),
                                  BoxShadow(
                                    color: const Color(0xff58cbf1)
                                        .withOpacity(0.4),
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
                      Consumer<ChargingProvider>(
                        builder: (BuildContext context, watch, Widget? child) {
                          return Positioned(
                              top: 315.h,
                              left: 53.w,
                              child: SizedBox(
                                width: 273.w,
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                      // thumb shape should be a rectangle with 50 radius and some custom widgets inside of it
                                      overlayShape:
                                          const RoundSliderOverlayShape(
                                        overlayRadius: 0,
                                      ),
                                      overlayColor: Colors.transparent,
                                      // track shape should should be rectangular with rounded borders and shadow effect
                                      trackShape:
                                          const RoundedRectSliderTrackShape(),
                                      trackHeight: 10,
                                      thumbShape:
                                          const TriangularSliderThumbShape()),
                                  child: Slider(
                                    activeColor: Colors.transparent,
                                    inactiveColor:
                                        Colors.black.withOpacity(0.2),
                                    thumbColor: Colors.black,
                                    value: watch.sliderValue,
                                    onChanged: (value) {
                                      watch.sliderValue = (value);
                                    },
                                    allowedInteraction:
                                        SliderInteraction.tapAndSlide,
                                  ),
                                ),
                              ));
                        },
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
                                  color:
                                      const Color(0xffEBEBF5).withOpacity(0.6),
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
                      height: isExpanded ? 314.h : 130.h,
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
                            vertical: 10, horizontal: 0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 90.h,
                              width: 297.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
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
                                          : Icons.keyboard_arrow_down_sharp,
                                      () {
                                    setState(
                                      () {
                                        isExpanded = !isExpanded;
                                      },
                                    );
                                  }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: isExpanded ? 10.h : 0.h,
                            ),
                            SingleChildScrollView(
                              child: Card(
                                elevation: 0,
                                color: Colors.transparent,
                                child: SingleChildScrollView(
                                  child: Container(
                                    color: Colors.transparent,
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
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff18191b),
                        Color(0xff18191b),
                        Color(0xff18191b),
                      ],
                    ),
                  ),
                  height: 500.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(17.3595.w, 20.9571.h);
    path_0.lineTo(24.9323.w, 8.56532.h);
    path_0.cubicTo(
        25.6774.w, 7.34611.h, 27.4236.w, 7.2789.h, 28.2602.w, 8.43724.h);
    path_0.lineTo(37.2098.w, 20.829);
    path_0.cubicTo(38.1651.w, 22.1517.h, 37.22.w, 24.h, 35.5885.w, 24.h);
    path_0.lineTo(19.0661.w, 24.h);
    path_0.cubicTo(17.5043.w, 24, 16.5451.h, 22.2898.w, 17.3595.h, 20.9571.w);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5851064, size.height * 0.1395349),
        Offset(size.width * 0.5851064, size.height * 0.5581395),
        [Color(0xff2FB8FF).withOpacity(1), Color(0xff9EECD9).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SliderActivePath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff242528).withOpacity(0.7);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.001824818, 0, size.width * 0.9963504,
                size.height),
            bottomRight: Radius.circular(size.width * 0.01642336),
            bottomLeft: Radius.circular(size.width * 0.01642336),
            topLeft: Radius.circular(size.width * 0.01642336),
            topRight: Radius.circular(size.width * 0.01642336)),
        paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TriangularSliderThumbShape extends SliderComponentShape {
  const TriangularSliderThumbShape({
    this.enabledThumbRadius = 0.0,
    this.disabledThumbRadius,
    this.elevation = 10.0,
    this.pressedElevation = 6.0,
  });

  final double enabledThumbRadius;
  final double? disabledThumbRadius;

  double get _disabledThumbRadius => disabledThumbRadius ?? enabledThumbRadius;

  final double elevation;
  final double pressedElevation;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(
        isEnabled ? enabledThumbRadius : _disabledThumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    Path path_0 = Path();
    Size size = Size(47, 43);
    final Canvas canvas = context.canvas
      ..translate(center.dx - 25, -size.height / 2 + 10);
    path_0.moveTo(17.3595, 20.9571);
    path_0.lineTo(24.9323, 8.56532);
    path_0.cubicTo(25.6774, 7.34611, 27.4236, 7.2789, 28.2602, 8.43724);
    path_0.lineTo(37.2098, 20.829);
    path_0.cubicTo(38.1651, 22.1517, 37.22, 24, 35.5885, 24);
    path_0.lineTo(19.0661, 24);
    path_0.cubicTo(17.5043, 24, 16.5451, 22.2898, 17.3595, 20.9571);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5851064, size.height * 0.1395349),
        Offset(size.width * 0.5851064, size.height * 0.5581395),
        [Color(0xff2FB8FF).withOpacity(1), Color(0xff9EECD9).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
