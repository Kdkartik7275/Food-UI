import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assignment/core/utils/constants/images.dart';
import 'package:assignment/src/onboarding/presentaion/widgets/wave_dots.dart';

class Onboard3Animation extends StatelessWidget {
  const Onboard3Animation({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        height: 270.r,
        width: 270.r,
        color: const Color(0xffFAEED1),
        child: Stack(
          children: [
            Positioned(
              left: 0.w,
              bottom: -20.h,
              child: Image.asset(
                AppImages.callPerson,
                height: 200.h,
                width: 200.w,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 80.h,
              right: 50.w,
              child: Image.asset(
                AppImages.bubble,
                height: 41.h,
                width: 41.w,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(top: 98.h, right: 60.w, child: const WaveDots()),
          ],
        ),
      ),
    );
  }
}
