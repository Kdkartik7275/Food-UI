import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/constants/images.dart';
import 'package:assignment/core/utils/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceImageWithTag extends StatelessWidget {
  const ServiceImageWithTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: 310.w,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              AppImages.vegetable,
              height: 120.h,
              width: 278.w,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 0.h,
            right: 0.w,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(6.r),
                      topRight: Radius.circular(6.r)),
                  color: AppColors.primary),
              alignment: Alignment.center,
              height: 30.h,
              width: 115.w,
              child: Text(
                'Recommended',
                textAlign: TextAlign.center,
                style: TTextStyle.titleSmall.copyWith(
                    color: AppColors.white, fontSize: 10.sp, letterSpacing: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
