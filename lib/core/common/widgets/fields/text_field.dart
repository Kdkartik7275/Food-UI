import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assignment/core/utils/constants/colors.dart';

class TTextField extends StatelessWidget {
  const TTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final String hintText;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.phone,
      style: GoogleFonts.lexend(
          fontSize: 13.sp, fontWeight: FontWeight.w400, color: AppColors.black),
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
          ),
          hintStyle: GoogleFonts.lexend(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textLighter),
          border: InputBorder.none),
    );
  }
}
