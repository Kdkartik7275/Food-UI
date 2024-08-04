import 'package:assignment/core/common/widgets/containers/rounded_container.dart';
import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/constants/images.dart';
import 'package:assignment/core/utils/styles/text_style.dart';
import 'package:assignment/src/home/presentation/widgets/details_list.dart';
import 'package:assignment/src/home/presentation/widgets/price_length.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CateringWidget extends StatelessWidget {
  const CateringWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      // height: 302.h,
      width: 290.w,
      margin: EdgeInsets.only(right: 15.w, top: 10.h, bottom: 5),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 1,
          offset: const Offset(0, 2),
        ),
      ],
      child: Column(
        children: [
          // IMAGE
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r)),
                child: Image.asset(
                  AppImages.vegetable,
                  height: 93.h,
                  width: 290.w,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 20.h,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(4.r),
                          topRight: Radius.circular(4.r)),
                      color: AppColors.primary),
                  alignment: Alignment.center,
                  height: 25,
                  width: 70.w,
                  child: Text(
                    'Popular',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexend(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),
          // DETAILS

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.veg,
                  height: 14.h, width: 14.h, fit: BoxFit.cover),
              SizedBox(width: 8.w),
              Text('Panjabi Special Menu', style: TTextStyle.titleMedium)
            ],
          ),
          SizedBox(height: 10.h),
          Image.asset(AppImages.divider),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  3,
                  (index) => const DetailsList(
                        details: [
                          '3 Live Counter',
                          '4 main',
                          '3 Desserts',
                          '3 Desserts',
                          '3 Desserts',
                        ],
                      )),
            ),
          ),
          const Divider(color: AppColors.border),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: const PriceAndPersonLength(
                persons: 'Min 200 Guests', price: '219'),
          ),
        ],
      ),
    );
  }
}
