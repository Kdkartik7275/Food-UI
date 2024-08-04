// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assignment/core/common/data/intro.dart';
import 'package:assignment/src/home/presentation/widgets/banner.dart';
import 'package:assignment/src/home/presentation/widgets/catering.dart';
import 'package:assignment/src/home/presentation/widgets/craftings.dart';
import 'package:assignment/src/home/presentation/widgets/delivery_box.dart';
import 'package:assignment/src/home/presentation/widgets/how_it_work.dart';
import 'package:assignment/src/home/presentation/widgets/service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:assignment/core/common/widgets/containers/rounded_container.dart';
import 'package:assignment/core/common/widgets/fields/text_field.dart';
import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/styles/text_style.dart';
import 'package:assignment/src/home/presentation/widgets/box_header.dart';
import 'package:assignment/src/home/presentation/widgets/meal_container.dart';

class HomeSceen extends StatelessWidget {
  const HomeSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // HEADER

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: const HomeHeader()),

            // BANNERS
            SizedBox(height: 20.h),
            const FoodBanners(),

            SizedBox(height: 20.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  // SEARCH FIELD
                  const SearchFoodField(),

                  // CRAFTINGS
                  SizedBox(height: 20.h),
                  const Craftings(),

                  // MEALS
                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // HEAD
                      const BoxHeader(
                          title: 'Meal Box',
                          subtitle:
                              'Individually packed meal boxes of happiness!',
                          persons: ' Min 10 )'),
                      SizedBox(height: 10.h),
                      const MealsPersonContainer()
                    ],
                  ),
                ],
              ),
            ),

            // DELIVERY BOX
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEAD
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: const BoxHeader(
                    persons: 'Min 10 - Max 25 )',
                    subtitle: 'Best for small gatherings and house-parties',
                    title: 'Delivery Box',
                  ),
                ),

                // DELIVERY BOXES

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(3, (index) => const DeliveryBox()),
                  ),
                ),
              ],
            ),

            //
            SizedBox(height: 15.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // HEADER
                  const BoxHeader(
                      title: 'Catering Menus',
                      subtitle:
                          'Best for weddings, Corporate Events, Birthdays etc',
                      persons: 'Min 200)'),

                  // CATERING WIDGETS
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          List.generate(3, (index) => const CateringWidget()),
                    ),
                  )
                ],
              ),
            ),
            // SERVICES
            SizedBox(height: 20.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text('Services',
                  style: TTextStyle.titleMedium.copyWith(fontSize: 18.sp)),
            ),

            // SERVICE WIDGET

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(3, (index) => const ServiceWidget()),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text('How does it work ?',
                  style: TTextStyle.titleMedium.copyWith(fontSize: 18.sp)),
            ),

            SizedBox(height: 15.h),

            ...List.generate(
              data.length,
              (index) => HowItWorkWidget(
                image: data[index].image,
                title: data[index].title,
                isEven: index % 2 != 0,
                subtitle: data[index].subtitle,
              ),
            ),

            SizedBox(height: 20.h),

            Padding(
              padding: EdgeInsets.only(left: 22.w),
              child: Text(
                'Delicious food with\nprofessional service !',
                textAlign: TextAlign.start,
                style: TTextStyle.titleLarge,
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

class SearchFoodField extends StatelessWidget {
  const SearchFoodField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      height: 40.h,
      width: 326.w,
      radius: 8.r,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 4,
          offset: const Offset(0, 1),
        ),
      ],
      padding: const EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
              child: TTextField(
                  hintText: 'Search Foods or Events',
                  controller: TextEditingController())),
          Icon(Icons.search, color: AppColors.primary, size: 25.h)
        ],
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi Monica!',
          style: GoogleFonts.lexend(
              fontSize: 22.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primary),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // LOCATIN
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Location',
                  style: GoogleFonts.lexend(
                      fontSize: 12.sp,
                      color: AppColors.textLighter,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1),
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.location_on, color: AppColors.primary),
                    Text(
                      'Hyderabad',
                      style: GoogleFonts.lexend(
                          fontSize: 14.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1),
                    ),
                    const Icon(Icons.arrow_drop_down)
                  ],
                )
              ],
            ),

            // HOW IT WORKS

            Column(
              children: [
                const Icon(Icons.play_circle_outline, color: AppColors.primary),
                Text(
                  'How it works?',
                  style: GoogleFonts.lexend(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.black),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
