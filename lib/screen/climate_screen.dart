import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import 'package:test1/common_widget/custom_appbar.dart';
import 'package:test1/common_widget/setting_button.dart';
import 'package:test1/models/climate_provider.dart';

class ClimateScreen extends StatefulWidget {
  const ClimateScreen({super.key});

  @override
  State<ClimateScreen> createState() => _ClimateScreenState();
}

class _ClimateScreenState extends State<ClimateScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            // the gradient color should be from #202327 to #292C31
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff202327),
                Color(0xff202327),
                Color(0xff202327),
                Color(0xff292C31),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                customAppBar(context, 'CLIMATE'),
                SizedBox(
                  height: 0.h,
                ),
                SizedBox(
                  height: 300.h,
                  width: 300.w,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            // drop shadow effect to the top left
                            BoxShadow(
                              color: const Color(0xffffffff).withOpacity(0.1),
                              spreadRadius: -60,
                              blurRadius: 10,
                              offset: const Offset(-4, -8),
                            ),
                          ],
                        ),
                        child: CustomPaint(
                          size: Size(370.w, (370.w * 1).toDouble()),
                          //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: RPSCustomPainter(),
                        ),
                      ),
                      // positioned text in the center of the circle
                      Consumer<ClimateProvider>(
                        builder: (context, value, child) => Positioned(
                          top: 120.h,
                          left: 103.w,
                          child: Container(
                            width: 100.w,
                            alignment: Alignment.center,
                            child: Text(
                              '${((double.tryParse(value.acSliderValue.toString())??0.0)*100).toStringAsFixed(0)}°',
                              style: TextStyle(
                                color: const Color(0xff5C5C62),
                                fontSize: 45.sp,
                                fontWeight: FontWeight.w100,
                                fontFamily: 'SfProBold',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 75.h,
                        left: 75.w,
                        child: SizedBox(
                          height: 150.h,
                          width: 150.w,
                          child: Consumer<ClimateProvider>(
                            builder: (context, value, child) => myIndicator(
                              value: value.acSliderValue,
                              size: 120,
                              strokeWidth: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Consumer<ClimateProvider>(
                  builder: (context, value, child) =>  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      buildClimateItems(context, 'AC', Icons.ac_unit_outlined, () {
                        value.acButton();
                      }, () {
                        value.acButton();
                      },value.acButtonON, (sliderValue) {
                        value.acSlider(sliderValue);
                      },
                        value.acSliderValue,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      buildClimateItems(context, 'Fan', Icons.air, () {}, () {value.fanButton();},value.fanButtonON, (sliderValue) {
                        value.fanSlider(sliderValue);
                      },
                        value.fanSliderValue,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      buildClimateItems(context, 'Heat', Icons.arrow_circle_up, () {}, () {value.heatButton();},value.heatButtonON, (sliderValue) {
                        value.heatSlider(sliderValue);
                      },
                        value.heatSliderValue,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      buildClimateItems(context, 'Auto', Icons.av_timer_sharp, () {}, () {value.autoButton();},value.autoButtonON, (sliderValue) {
                        value.autoSlider(sliderValue);
                      },
                        value.autoSliderValue,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.05),
                        height: 200.h,
                      ),
                    ],
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  circularContainer(
    String value,
  ) {
    return Container(
      height: 200.h,
      width: 200.w,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(1),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
          // shadow color 0xff00000 2% to the bottom side with more blur radius
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.02),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 2),
          ),
          // shadow color 0xff00000 2% to the left side with more blur radius
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.02),
            spreadRadius: 5,
            blurRadius: 20,
            offset: const Offset(-2, 0),
          ),
        ],
      ),
      // inside is another container with the same size and shape but the shadows are inwards
      child: Stack(
        children: [
          Container(
            width: 300.w,
            height: 300.h,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(50.r),
              ),
            ),
            child: CustomPaint(
              painter: MyPainter(),
              child: Container(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25.r),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                shape: BoxShape.circle,
                boxShadow: [
                  // shadow color 0xff00000 2% to the top side with more blur radius
                  BoxShadow(
                    color: const Color(0xffEBEBF5).withOpacity(0.09),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(-6, -8),
                  ),
                  // shadow color 0xff00000 2% to the bottom side with more blur radius
                  BoxShadow(
                    color: const Color(0xffffffff).withOpacity(0.02),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: const Offset(0, 2),
                  ),
                  // shadow color 0xff00000 2% to the left side with more blur radius
                  BoxShadow(
                    color: const Color(0xffffffff).withOpacity(0.02),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: const Offset(-2, 0),
                  ),
                ],
              ),
              child: Center(
                //large white bold text, which will be number
                child: Text(
                  value,
                  style: TextStyle(
                    color: const Color(0xff5C5C62),
                    fontSize: 54.sp,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'SfProBold',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildClimateItems(BuildContext context, String text, IconData icon,
      VoidCallback voidCallback,VoidCallback onButtonPressed,bool isOn, Function(double) onSliderChange,double currentValue) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              text,
              style: TextStyle(
                color: const Color(0xffEBEBF5).withOpacity(0.6),
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'SfProBold',
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: settingButton(context, icon, () {
              onButtonPressed();
              _showBottomSheet(context, currentValue.toString(), isOn);
            }),
          ),
          // slider with custom indicator
          Expanded(
            flex: 9,
            child: SizedBox(
              width: 192.w,
              height: 15.h,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    // thumb shape should be a rectangle with 50 radius and some custom widgets inside of it
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 0,
                    ),
                    overlayColor: Colors.black,
                    // track shape should should be rectangular with rounded borders and shadow effect
                    trackShape: const RoundedRectSliderTrackShape(),
                    trackHeight: 6,
                    thumbShape: const RectSliderThumbShape()),
                child: Slider(
                  activeColor: const Color(0xff2FB8FF).withOpacity(0.7),
                  inactiveColor: Colors.black.withOpacity(0.2),
                  thumbColor: Colors.black,
                  value: currentValue,
                  onChanged: (value) {
                    print('value: $value');
                    onSliderChange(value);
                  },
                  allowedInteraction: SliderInteraction.tapAndSlide,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // bottom sheet function which will be called when the user clicks on the settings button
  void _showBottomSheet(BuildContext context, String value, bool PowerOn) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40.r)),
      ),
      elevation: 5,
      backgroundColor: Colors.black.withOpacity(1),
      context: context,
      builder: (context) {
        return BackdropFilter(
          // filter for the blur glass like effect
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),

          child: GlassmorphicContainer(
            margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
            height: 150.h,
            width: 390.w,
            blur: 1,
            //--code to remove border
            border: 0,
            shape: BoxShape.circle,
            // Color(0xff2FB8FF).withOpacity(0.3),
            // Colors.white.withOpacity(0.2),
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.2),
                const Color(0xff2FB8FF).withOpacity(0.3),
              ],
            ),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.blue.withOpacity(0.3),
              ],
            ),
            borderRadius: 40.r,
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                // a row with 4 buttons, one is icon button, second is left arrow button
                // value and then right arrow button and then a button with check icon
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) => const RadialGradient(
                          center: Alignment.topCenter,
                          stops: [.5, 1],
                          colors: [
                            Color(0xff2FB8FF),
                            Color(0xff9EECD9),
                          ],
                        ).createShader(bounds),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.power_settings_new,
                            color: const Color(0xffEBEBF5).withOpacity(0.6),
                            size: 30,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.left_chevron,
                          color: const Color(0xffEBEBF5).withOpacity(0.6),
                          size: 18.sp,
                        ),
                      ),
                      Text(
                        '${((double.tryParse(value)??0.0)*100).toStringAsFixed(0)}°',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SfProBold',
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.right_chevron,
                          color: const Color(0xffEBEBF5).withOpacity(0.6),
                          size: 18.sp,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.event,
                          color: const Color(0xffEBEBF5).withOpacity(0.6),
                          size: 22.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                // a row with text on or off and a text value both at the other side of things
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 35.0.w, vertical: 25.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'On',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SfProBold',
                        ),
                      ),
                      Text(
                        'Vent',
                        style: TextStyle(
                          color: const Color(0xffEBEBF5).withOpacity(0.6),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SfProBold',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget myIndicator({
    required double value,
    required double size,
    required double strokeWidth,
  }) {
    return CustomPaint(
      painter: MyIndicatorPainter(
        value: value,
        size: size,
        strokeWidth: strokeWidth,
        color: [
          const Color(0xff9EECD9),
          const Color(0xff9EECD9),
          const Color(0xff2FB8FF),
          const Color(0xff2FB8FF),
        ],
      ),
    );
  }
}

class MyIndicatorPainter extends CustomPainter {
  final double value;
  final double size;
  final double strokeWidth;
  final List<Color> color;

  MyIndicatorPainter({
    required this.value,
    required this.size,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    final Rect rect = Rect.fromCircle(center: center, radius: radius);

    const double startAngle = -pi / 2;
    final double sweepAngle = 2 * pi * value;

    final Gradient gradient = SweepGradient(
      startAngle: 0,
      endAngle: 2 * pi,
      colors: color,
    );

    final Rect rect2 = Rect.fromCircle(center: center, radius: radius);

    final Gradient gradient2 = SweepGradient(
      startAngle: 0,
      endAngle: 2 * pi,
      colors: color,
    );

    canvas.drawArc(rect, startAngle, sweepAngle, false,
        paint..shader = gradient.createShader(rect2));

    canvas.drawArc(rect, startAngle, sweepAngle, false,
        paint..shader = gradient2.createShader(rect2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class RectSliderThumbShape extends SliderComponentShape {
  const RectSliderThumbShape({
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
    return Size.fromRadius(isEnabled ? enabledThumbRadius : _disabledThumbRadius);
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
    assert(sliderTheme.disabledThumbColor != null);
    assert(sliderTheme.thumbColor != null);
    Size size=Size(72.w, 63.h);
    final Canvas canvas = context.canvas..translate(center.dx-25, -size.height / 2 + 10);
    final Tween<double> radiusTween = Tween<double>(
      begin: _disabledThumbRadius,
      end: enabledThumbRadius,
    );
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );

    final Color color = colorTween.evaluate(enableAnimation)!;
    final double radius = radiusTween.evaluate(enableAnimation);

    final Tween<double> elevationTween = Tween<double>(
      begin: elevation,
      end: pressedElevation,
    );

    final double evaluatedElevation = elevationTween.evaluate(activationAnimation);
    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(Offset(size.width*0.3046875,size.height*0.3285714), Offset(size.width*0.6138444,size.height*0.6712032), [Color(0xff2E3236).withOpacity(1),Color(0xff141515).withOpacity(1)], [0,1]);
    canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(size.width*0.2777778,size.height*0.3015873,size.width*0.3819444,size.height*0.2698413),bottomRight: Radius.circular(size.width*0.08333333),bottomLeft:  Radius.circular(size.width*0.08333333),topLeft:  Radius.circular(size.width*0.08333333),topRight:  Radius.circular(size.width*0.08333333)),paint_0_fill);

    Paint paint_1_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_1_stroke.color=Color(0xff212325).withOpacity(1.0);
    canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(size.width*0.2777778,size.height*0.3015873,size.width*0.3819444,size.height*0.2698413),bottomRight: Radius.circular(size.width*0.08333333),bottomLeft:  Radius.circular(size.width*0.08333333),topLeft:  Radius.circular(size.width*0.08333333),topRight:  Radius.circular(size.width*0.08333333)),paint_1_stroke);

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(size.width*0.2777778,size.height*0.3015873,size.width*0.3819444,size.height*0.2698413),bottomRight: Radius.circular(size.width*0.08333333),bottomLeft:  Radius.circular(size.width*0.08333333),topLeft:  Radius.circular(size.width*0.08333333),topRight:  Radius.circular(size.width*0.08333333)),paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(29.w,22.h);
    path_2.cubicTo(29.w,21.4477.h,29.4477.w,21.h,30.w,21.h);
    path_2.lineTo(31.75.w,21.h);
    path_2.cubicTo(32.3023.w,21.h,32.75.w,21.4477.h,32.75.w,22.h);
    path_2.lineTo(32.75.w,33.h);
    path_2.cubicTo(32.75.w,33.5523,32.3023.w,34.h,31.75.w,34.h);
    path_2.lineTo(30.w,34.h);
    path_2.cubicTo(29.4477.w,34.h,29.w,33.5523.h,29.w,33.h);
    path_2.lineTo(29.w,22.h);
    path_2.close();

    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = Color(0xff272A2E).withOpacity(1.0);
    canvas.drawPath(path_2,paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(34.75.w,22.h);
    path_3.cubicTo(34.75.w,21.4477.h,35.1977.w,21.h,35.75.w,21.h);
    path_3.lineTo(37.5.w,21.h);
    path_3.cubicTo(38.0523.w,21.h,38.5.w,21.4477.h,38.5.w,22.h);
    path_3.lineTo(38.5.w,33.h);
    path_3.cubicTo(38.5.w,33.5523.h,38.0523.w,34.h,37.5.w,34.h);
    path_3.lineTo(35.75.w,34.h);
    path_3.cubicTo(35.1977.w,34.h,34.75.w,33.5523.h,34.75.w,33.h);
    path_3.lineTo(34.75.w,22.h);
    path_3.close();

    Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
    paint_3_fill.color = const Color(0xff272A2E).withOpacity(1.0);
    canvas.drawPath(path_3,paint_3_fill);

    bool paintShadows = true;
    assert(() {
      if (debugDisableShadows) {
        paintShadows = false;
      }
      return true;
    }());
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Get the center of the canvas

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.3046875, size.height * 0.3285714),
        Offset(size.width * 0.6138444, size.height * 0.6712032),
        [const Color(0xff2E3236).withOpacity(1), const Color(0xff141515).withOpacity(1)],
        [0, 1]);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2777778, size.height * 0.3015873,
                size.width * 0.3819444, size.height * 0.2698413),
            bottomRight: Radius.circular(size.width * 0.08333333),
            bottomLeft: Radius.circular(size.width * 0.08333333),
            topLeft: Radius.circular(size.width * 0.08333333),
            topRight: Radius.circular(size.width * 0.08333333)),
        paint_0_fill);

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint_1_stroke.color = const Color(0xff212325).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2777778, size.height * 0.3015873,
                size.width * 0.3819444, size.height * 0.2698413),
            bottomRight: Radius.circular(size.width * 0.08333333),
            bottomLeft: Radius.circular(size.width * 0.08333333),
            topLeft: Radius.circular(size.width * 0.08333333),
            topRight: Radius.circular(size.width * 0.08333333)),
        paint_1_stroke);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = const Color(0xff000000).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2777778, size.height * 0.3015873,
                size.width * 0.3819444, size.height * 0.2698413),
            bottomRight: Radius.circular(size.width * 0.08333333),
            bottomLeft: Radius.circular(size.width * 0.08333333),
            topLeft: Radius.circular(size.width * 0.08333333),
            topRight: Radius.circular(size.width * 0.08333333)),
        paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(29.w, 22.h);
    path_2.cubicTo(29.w, 21.4477.h, 29.4477.w, 21.h, 30.w, 21.h);
    path_2.lineTo(31.75.w, 21.h);
    path_2.cubicTo(32.3023.w, 21.h, 32.75.w, 21.4477.h, 32.75.w, 22.h);
    path_2.lineTo(32.75.w, 33.h);
    path_2.cubicTo(32.75.w, 33.5523.h, 32.3023.w, 34.h, 31.75.w, 34.h);
    path_2.lineTo(30.w, 34.h);
    path_2.cubicTo(29.4477.w, 34.h, 29.w, 33.5523.h, 29.w, 33.h);
    path_2.lineTo(29.w, 22.h);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = const Color(0xff272A2E).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(34.75.w, 22.h);
    path_3.cubicTo(34.75.w, 21.4477.h, 35.1977.w, 21.h, 35.75.w, 21.h);
    path_3.lineTo(37.5.w, 21.h);
    path_3.cubicTo(38.0523.w, 21.h, 38.5.w, 21.4477.h, 38.5.w, 22.h);
    path_3.lineTo(38.5.w, 33.h);
    path_3.cubicTo(38.5.w, 33.5523.h, 38.0523.w, 34.h, 37.5.w, 34.h);
    path_3.lineTo(35.75.w, 34.h);
    path_3.cubicTo(35.1977.w, 34.h, 34.75.w, 33.5523.h, 34.75.w, 33.h);
    path_3.lineTo(34.75.w, 22.h);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = const Color(0xff272A2E).withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.6633027, size.height * 0.6916617),
        Offset(size.width * 0.3286647, size.height * 0.3173205),
        [const Color(0xff101113).withOpacity(1), const Color(0xff2B2F33).withOpacity(1)],
        [0, 1]);
    canvas.drawCircle(Offset(size.width * 0.4988190, size.height * 0.4988190),
        size.width * 0.2495614, paint_0_fill);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = const Color(0xff32363B).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3234421, size.height * 0.3234421,
                size.width * 0.3538487, size.height * 0.3538487),
            bottomRight: Radius.circular(size.width * 0.1769243),
            bottomLeft: Radius.circular(size.width * 0.1769243),
            topLeft: Radius.circular(size.width * 0.1769243),
            topRight: Radius.circular(size.width * 0.1769243)),
        paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
