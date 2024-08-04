import 'package:assignment/core/common/widgets/containers/rounded_container.dart';
import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/constants/images.dart';
import 'package:assignment/core/utils/styles/text_style.dart';
import 'package:assignment/src/home/presentation/widgets/delivery_point.dart';
import 'package:assignment/src/home/presentation/widgets/service_image_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      width: 310.w,
      radius: 6.r,
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(0, 2),
        ),
      ],
      child: Column(
        children: [
          const ServiceImageWithTag(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(AppImages.delivery),
                    SizedBox(width: 10.w),
                    Text(
                      'Delivery',
                      style: GoogleFonts.lexend(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                const DeliveryPoint(point: 'High Quality Disposable Cutlery'),
                SizedBox(height: 10.h),
                const DeliveryPoint(
                    point: 'Elegant Decorations & Table Settings'),
                SizedBox(height: 10.h),
                const DeliveryPoint(point: 'High Quality Disposable Cutlery'),
                SizedBox(height: 10.h),
                const DeliveryPoint(point: 'Served by Waitstaff'),
                SizedBox(height: 10.h),
                const DeliveryPoint(
                    point: 'Best for Weddings, Corporate Events etc'),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
                onPressed: () {},
                child: Text('Know More',
                    style: TTextStyle.titleSmall
                        .copyWith(color: AppColors.primary))),
          )
        ],
      ),
    );
  }
}
