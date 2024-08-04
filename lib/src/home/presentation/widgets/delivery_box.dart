import 'package:assignment/core/common/widgets/containers/rounded_container.dart';
import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/constants/images.dart';
import 'package:assignment/core/utils/styles/text_style.dart';
import 'package:assignment/src/home/presentation/widgets/details_list.dart';
import 'package:assignment/src/home/presentation/widgets/price_length.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryBox extends StatelessWidget {
  const DeliveryBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      margin: EdgeInsets.only(left: 12.w, top: 10.h, bottom: 5),
      //   backgroundColor: AppColors.green,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 0,
          blurRadius: 1,
          offset: const Offset(0, 2),
        ),
      ],
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TITLE
          Row(
            children: [
              Image.asset(AppImages.veg,
                  height: 14.h, width: 14.h, fit: BoxFit.cover),
              SizedBox(width: 8.w),
              Text('Delivery Box 1', style: TTextStyle.titleMedium)
            ],
          ), // DETAILS
          SizedBox(height: 10.h),

          // DETAILS AND FOOD IMAGE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // DETAILS
              const DetailsList(
                details: [
                  '3 Live Counter',
                  '4 main',
                  '3 Desserts',
                  '3 Desserts',
                  '3 Desserts',
                ],
              ),

              // IMAGE

              Image.asset(
                AppImages.salad,
                height: 103.h,
                width: 104.w,
                fit: BoxFit.contain,
                alignment: Alignment.centerRight,
              )
            ],
          ),

          const Divider(color: AppColors.border),

          // PRICE AND PERSON LIMIT

          const PriceAndPersonLength(persons: 'Min 10 - Max 50', price: '219'),
        ],
      ),
    );
  }
}
