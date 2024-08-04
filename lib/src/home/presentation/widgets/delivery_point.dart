import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryPoint extends StatelessWidget {
  const DeliveryPoint({
    super.key,
    required this.point,
  });

  final String point;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppImages.star,
          height: 16.h,
          width: 16.w,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            point,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lexend(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
