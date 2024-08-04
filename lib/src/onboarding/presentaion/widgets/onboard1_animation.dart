import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assignment/core/utils/constants/images.dart';

class Onboard1Animation extends StatefulWidget {
  const Onboard1Animation({super.key});

  @override
  _Onboard1AnimationState createState() => _Onboard1AnimationState();
}

class _Onboard1AnimationState extends State<Onboard1Animation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _leftArmRotation;
  late Animation<double> _rightArmRotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _leftArmRotation =
        Tween<double>(begin: -0.1, end: 0.0).animate(_controller);
    _rightArmRotation =
        Tween<double>(begin: 0.0, end: -0.2).animate(_controller);
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
        // FLOOR
        Image.asset(
          AppImages.floor,
          width: 204.w,
          height: 118.h,
          fit: BoxFit.contain,
        ),

        // LEGS PART
        Positioned(
          bottom: 0.h,
          right: 78.w,
          child: Image.asset(
            AppImages.bottom,
            height: 89.h,
            width: 114.w,
            fit: BoxFit.contain,
          ),
        ),

        // PLATE
        Positioned(
          bottom: 25.h,
          left: 70.w,
          child: Image.asset(
            AppImages.plate,
            height: 38.h,
            width: 63.w,
            fit: BoxFit.contain,
          ),
        ),

        // LEFT ARM
        Positioned(
          bottom: 93.h,
          right: 105.w,
          child: AnimatedBuilder(
            animation: _leftArmRotation,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.topCenter,
                transform: Matrix4.rotationZ(_leftArmRotation.value),
                child: child,
              );
            },
            child: Image.asset(
              AppImages.leftarm,
              height: 64.h,
              width: 50.w,
              fit: BoxFit.contain,
            ),
          ),
        ),

        // CHEST
        Positioned(
          bottom: 72.h,
          left: 102.w,
          child: Image.asset(
            AppImages.chest,
            height: 67.h,
            width: 54.w,
            fit: BoxFit.contain,
          ),
        ),

        // RIGHT ARM
        Positioned(
          bottom: 85.h,
          left: 86.w,
          child: AnimatedBuilder(
            animation: _rightArmRotation,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.topCenter,
                transform: Matrix4.rotationZ(_rightArmRotation.value),
                child: child,
              );
            },
            child: Image.asset(
              AppImages.rightarm,
              height: 50.h,
              width: 57.w,
              fit: BoxFit.contain,
            ),
          ),
        ),

        // HEAD
        Positioned(
          bottom: 129.h,
          left: 108.w,
          child: Image.asset(
            AppImages.head,
            height: 52.h,
            width: 42.w,
            fit: BoxFit.contain,
          ),
        ),

        // FOODS
        Positioned(
          top: 120.h,
          left: 0.w,
          child: Image.asset(
            AppImages.food,
            height: 74.h,
            width: 74.w,
            fit: BoxFit.contain,
          ),
        ),

        Positioned(
          top: 65.h,
          left: 30.w,
          child: Image.asset(
            AppImages.food2,
            height: 62.h,
            width: 60.w,
            fit: BoxFit.contain,
          ),
        ),

        Positioned(
          top: 20.h,
          left: 90.w,
          child: Image.asset(
            AppImages.food3,
            height: 74.h,
            width: 74.w,
            fit: BoxFit.contain,
          ),
        ),

        Positioned(
          top: 40.h,
          right: 50.w,
          child: Image.asset(
            AppImages.food4,
            height: 74.h,
            width: 74.w,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 120.h,
          right: 25.w,
          child: Image.asset(
            AppImages.food5,
            height: 74.h,
            width: 74.w,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
