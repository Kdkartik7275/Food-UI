import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assignment/core/utils/constants/images.dart';

class Onboard2Animation extends StatefulWidget {
  const Onboard2Animation({super.key});

  @override
  _Onboard2AnimationState createState() => _Onboard2AnimationState();
}

class _Onboard2AnimationState extends State<Onboard2Animation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _foodAnimation;
  late Animation<double> _flowerAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _foodAnimation = Tween<double>(begin: 0.2, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    _flowerAnimation = Tween<double>(begin: 0.0, end: 180.0.w).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // BOTTOM LINE
        const Divider(),

        // FLOWER POT
        AnimatedBuilder(
          animation: _flowerAnimation,
          builder: (context, child) {
            return Positioned(
              bottom: 7.h,
              left: 20.w + _flowerAnimation.value,
              child: Image.asset(
                AppImages.flower,
                height: 100.h,
                width: 85.w,
                fit: BoxFit.contain,
              ),
            );
          },
        ),

        // LADY AVATAR
        Positioned(
          bottom: -5.h,
          child: Image.asset(
            AppImages.lady,
            height: 225.h,
            width: 85.w,
            fit: BoxFit.contain,
          ),
        ),

        // WINDOWS
        Positioned(
          top: 50.h,
          left: 30.w,
          child: Image.asset(
            height: 73.h,
            width: 51.w,
            AppImages.leftwindow,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 50.h,
          right: 40.w,
          child: Image.asset(
            height: 88.h,
            width: 51.w,
            AppImages.rightwindow,
            fit: BoxFit.contain,
          ),
        ),

        // FOODS
        AnimatedBuilder(
          animation: _foodAnimation,
          builder: (context, child) {
            return Positioned(
              top: 120.h - (10.h * _foodAnimation.value),
              left: 80.w - (20.w * _foodAnimation.value),
              child: Image.asset(
                AppImages.sandwich,
                height: 19.h,
                width: 34.w,
                fit: BoxFit.contain,
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _foodAnimation,
          builder: (context, child) {
            return Positioned(
              top: 85.h - (20.h * _foodAnimation.value),
              left: 65.w - (20.w * _foodAnimation.value),
              child: Image.asset(
                AppImages.donut,
                height: 24.h,
                width: 24.w,
                fit: BoxFit.contain,
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _foodAnimation,
          builder: (context, child) {
            return Positioned(
              top: 55.h - (30.h * _foodAnimation.value),
              left: 90.w - (20.w * _foodAnimation.value),
              child: Image.asset(
                AppImages.burger,
                height: 23.h,
                width: 25.w,
                fit: BoxFit.contain,
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _foodAnimation,
          builder: (context, child) {
            return Positioned(
              top: 50.h - (30.h * _foodAnimation.value),
              right: 110.w - (20.w * _foodAnimation.value),
              child: Image.asset(
                AppImages.milk,
                height: 32.h,
                width: 34.w,
                fit: BoxFit.contain,
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _foodAnimation,
          builder: (context, child) {
            return Positioned(
              top: 85.h - (30.h * _foodAnimation.value),
              right: 90.w - (20.w * _foodAnimation.value),
              child: Image.asset(
                AppImages.apple,
                height: 22.h,
                width: 18.w,
                fit: BoxFit.contain,
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _foodAnimation,
          builder: (context, child) {
            return Positioned(
              top: 120.h - (10.h * _foodAnimation.value),
              right: 100.w - (20.w * _foodAnimation.value),
              child: Image.asset(
                AppImages.fish,
                height: 24.h,
                width: 24.w,
                fit: BoxFit.contain,
              ),
            );
          },
        ),
      ],
    );
  }
}
