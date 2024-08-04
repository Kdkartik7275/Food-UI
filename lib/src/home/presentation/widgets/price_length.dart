import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceAndPersonLength extends StatelessWidget {
  const PriceAndPersonLength({
    super.key,
    required this.persons,
    required this.price,
  });

  final String persons;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.person,
              color: AppColors.textLighter,
              size: 16.h,
            ),
            Text(
              persons,
              style: TTextStyle.titleSmall.copyWith(
                  fontWeight: FontWeight.w300, color: AppColors.textLighter),
            )
          ],
        ),
        Row(
          children: [
            Text('Starts at',
                style: TTextStyle.titleMedium.copyWith(fontSize: 14.sp)),
            Text(' ₹ $price',
                style: TTextStyle.titleMedium
                    .copyWith(color: AppColors.primary, fontSize: 14.sp)),
          ],
        )
      ],
    );
  }
}
