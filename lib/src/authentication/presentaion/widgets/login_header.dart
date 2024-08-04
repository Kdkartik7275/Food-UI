import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assignment/core/common/widgets/containers/rounded_container.dart';
import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/constants/images.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      height: 382.h,
      width: 375.w,
      customRadiusRequired: true,
      customRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r)),
      backgroundColor: AppColors.primary,
      child: Container(
        height: 291.h,
        width: 327.w,
        margin: EdgeInsets.fromLTRB(20.w, 68.h, 20.w, 20.h),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppImages.logo,
              fit: BoxFit.contain,
              alignment: Alignment.topLeft,
              height: 150.h,
              width: 150.h,
            ),
            Text(
              'India’s 1st Dynamic Pricing Food Catering App',
              style: GoogleFonts.lexend(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
