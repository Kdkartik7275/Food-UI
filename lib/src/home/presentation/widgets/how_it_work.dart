import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HowItWorkWidget extends StatelessWidget {
  const HowItWorkWidget({
    super.key,
    required this.isEven,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final bool isEven;
  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isEven
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TTextStyle.titleMedium.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary)),
                      Text(
                        subtitle,
                        style: TTextStyle.titleSmall.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff474747)),
                        maxLines: null,
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          isEven ? SizedBox(width: 10.w) : const SizedBox(),
          Image.asset(image, height: 120.h, width: 120.w),
          !isEven ? SizedBox(width: 10.w) : const SizedBox(),
          !isEven
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TTextStyle.titleMedium.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary)),
                      Text(
                        subtitle,
                        style: TTextStyle.titleSmall.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff474747)),
                        maxLines: null,
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
