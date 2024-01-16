import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/common_widget/custom_appbar.dart';
import 'package:test1/common_widget/setting_button.dart';

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
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              customAppBar(context, 'CLIMATE'),
              SizedBox(
                height: 97.h,
              ),
              ClipRRect(
                child: circularContainer('2'),
              ),
              SizedBox(
                height: 78.h,
              ),
              buildClimateItems(context, 'AC', Icons.ac_unit_outlined, () {}),
              SizedBox(
                height: 40.h,
              ),
              buildClimateItems(context, 'Fan', Icons.air, () {}),
              SizedBox(
                height: 40.h,
              ),
              buildClimateItems(context, 'Heat', Icons.arrow_circle_up, () {}),
              SizedBox(
                height: 40.h,
              ),
              buildClimateItems(context, 'Auto', Icons.av_timer_sharp, () {}),
            ],
          ),
        ),
      ),
    );
  }

  circularContainer(
    String value,
  ) {
    return Container(
      height: 168.h,
      width: 168.w,
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
      child: Padding(
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
    );
  }

  Row buildClimateItems(BuildContext context, String text, IconData icon,
      VoidCallback voidCallback) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          text,
          style: TextStyle(
            color: const Color(0xffEBEBF5).withOpacity(0.6),
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'SfProBold',
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        settingButton(context, icon, () {
          _showBottomSheet(context, '1.0', (value) {});
        }),
        SizedBox(
          width: 10.w,
        ),
        // slider with custom indicator
        SizedBox(
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
                thumbShape: RectSliderThumbShape()),
            child: Slider(
              activeColor: const Color(0xff2FB8FF).withOpacity(0.7),
              inactiveColor: Colors.black.withOpacity(0.2),
              thumbColor: Colors.black,
              value: 0.2,
              onChanged: (value) {},
              allowedInteraction: SliderInteraction.slideThumb,
            ),
          ),
        ),
      ],
    );
  }

  // bottom sheet function which will be called when the user clicks on the settings button
  void _showBottomSheet(BuildContext context, String value, onChanged) {
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
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),

          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
            height: 144.h,
            width: 390.w,
            // margin:
            //     const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.all(
                Radius.circular(40.r),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Color(0xff2FB8FF).withOpacity(0.3),
                  Colors.white.withOpacity(0.2),
                ],
                stops: [0.2, 1.0],
              ),
            ),
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
                        shaderCallback: (Rect bounds) => RadialGradient(
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
                      ),),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.left_chevron,
                          color: const Color(0xffEBEBF5).withOpacity(0.6),
                          size: 18.sp,
                        ),
                      ),
                      Text(
                        value+'°',
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
                  padding: EdgeInsets.symmetric(horizontal: 35.0.w,vertical: 25.h),
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
}

class RectSliderThumbShape extends SliderComponentShape {
  /// Create a slider thumb that draws a Rect.
  const RectSliderThumbShape({
    this.enabledThumbRadius = 10.0,
    this.disabledThumbRadius,
    this.elevation = 1.0,
    this.pressedElevation = 6.0,
  });

  /// The preferred radius of the round thumb shape when the slider is enabled.
  ///
  /// If it is not provided, then the Material Design default of 10 is used.
  final double enabledThumbRadius;

  /// The preferred radius of the round thumb shape when the slider is disabled.
  ///
  /// If no disabledRadius is provided, then it is equal to the
  /// [enabledThumbRadius]
  final double? disabledThumbRadius;

  double get _disabledThumbRadius => disabledThumbRadius ?? enabledThumbRadius;

  /// The resting elevation adds shadow to the unpressed thumb.
  ///
  /// The default is 1.
  ///
  /// Use 0 for no shadow. The higher the value, the larger the shadow. For
  /// example, a value of 12 will create a very large shadow.
  ///
  final double elevation;

  /// The pressed elevation adds shadow to the pressed thumb.
  ///
  /// The default is 6.
  ///
  /// Use 0 for no shadow. The higher the value, the larger the shadow. For
  /// example, a value of 12 will create a very large shadow.
  final double pressedElevation;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(
        isEnabled == true ? enabledThumbRadius : _disabledThumbRadius);
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

    final Canvas canvas = context.canvas;
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

    final double evaluatedElevation =
        elevationTween.evaluate(activationAnimation);
    final Path path = Path()
      ..addOval(Rect.fromCenter(
          center: center, width: 2 * radius, height: 3 * radius));

    bool paintShadows = true;
    assert(() {
      if (debugDisableShadows) {
        paintShadows = false;
      }
      return true;
    }());

    if (paintShadows) {
      canvas.drawShadow(
          path, Colors.black.withOpacity(0.4), evaluatedElevation, true);
    }

    // Use drawRect instead of drawCircle
    canvas.drawRect(
      Rect.fromCircle(center: center, radius: radius),
      Paint()..color = color,
    );
  }
}
