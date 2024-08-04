// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/styles/text_style.dart';

class BoxHeader extends StatelessWidget {
  const BoxHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.persons,
  });

  final String title;
  final String subtitle;
  final String persons;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,
                    style: TTextStyle.titleMedium.copyWith(fontSize: 18.sp)),
                Text(
                  ' ( ',
                  style: TTextStyle.titleSmall.copyWith(
                      fontWeight: FontWeight.w300,
                      color: AppColors.textLighter),
                ),
                Icon(
                  Icons.person,
                  color: AppColors.textLighter,
                  size: 16.h,
                ),
                Text(
                  persons,
                  style: TTextStyle.titleSmall.copyWith(
                      fontWeight: FontWeight.w300,
                      color: AppColors.textLighter),
                )
              ],
            ),
            Text(subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TTextStyle.titleSmall.copyWith(
                    color: AppColors.textLighter,
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp))
          ],
        ),
        Text(
          'More',
          style: TTextStyle.titleSmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp),
        )
      ],
    );
  }
}
