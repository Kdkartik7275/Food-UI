import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assignment/core/utils/constants/colors.dart';

class TTextStyle {
  // HEADLINE STYLES
  static TextStyle headlineLarge = GoogleFonts.capriola().copyWith(
      fontSize: 32.0.sp, fontWeight: FontWeight.w400, color: AppColors.text);

  // BODY STYLES

  // TITLE STYLES

  static TextStyle titleLarge = GoogleFonts.lexend().copyWith(
      fontSize: 22.0.sp, fontWeight: FontWeight.w400, color: AppColors.text);

  static TextStyle titleMedium = GoogleFonts.lexend().copyWith(
      fontSize: 16.0.sp, fontWeight: FontWeight.w400, color: AppColors.text);

  static TextStyle titleSmall = GoogleFonts.lexend().copyWith(
      fontSize: 14.0.sp, fontWeight: FontWeight.w600, color: AppColors.text);
}
