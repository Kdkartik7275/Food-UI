import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/constants/images.dart';
import 'package:assignment/src/home/presentation/widgets/detail_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Craftings extends StatelessWidget {
  const Craftings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Start crafting',
          style: GoogleFonts.lexend(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primary),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DetailBox(
              image: AppImages.platter,
              label: 'Defalut Platter',
              height: 120.h,
              width: 155.w,
              fit: BoxFit.cover,
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
              image: AppImages.soon,
              label: 'Craft Your own',
              height: 120.h,
              width: 155.w,
              fit: BoxFit.cover,
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
        )
      ],
    );
  }
}
