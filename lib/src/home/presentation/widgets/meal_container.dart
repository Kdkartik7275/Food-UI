import 'package:assignment/core/utils/constants/images.dart';
import 'package:assignment/src/home/presentation/widgets/detail_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealsPersonContainer extends StatelessWidget {
  const MealsPersonContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DetailBox(
          height: 126.h,
          width: 103.w,
          image: AppImages.three,
          label: '3 CP',
          imageBorder: BorderRadius.zero,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        DetailBox(
          height: 126.h,
          width: 103.w,
          image: AppImages.five,
          label: '5 CP',
          imageBorder: BorderRadius.zero,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        DetailBox(
          height: 126.h,
          width: 103.w,
          image: AppImages.eight,
          label: '8 CP',
          imageBorder: BorderRadius.zero,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
      ],
    );
  }
}
