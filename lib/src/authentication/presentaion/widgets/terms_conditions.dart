import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/styles/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By continuing, I accept ',
        style: TTextStyle.titleSmall.copyWith(
            fontSize: 13.sp,
            color: AppColors.textLighter,
            fontWeight: FontWeight.w300),
        children: <TextSpan>[
          TextSpan(
            text: 'Terms & Conditions',
            style: TTextStyle.titleMedium.copyWith(
                fontSize: 13.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w500),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Handle Terms & Conditions tap
              },
          ),
          TextSpan(
            text: ' and ',
            style: TTextStyle.titleSmall.copyWith(
                fontSize: 13.sp,
                color: AppColors.textLighter,
                fontWeight: FontWeight.w300),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TTextStyle.titleMedium.copyWith(
                fontSize: 13.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w500),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Handle Privacy Policy tap
              },
          ),
        ],
      ),
    );
  }
}
