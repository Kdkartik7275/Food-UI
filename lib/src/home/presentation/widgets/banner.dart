import 'package:assignment/core/common/widgets/containers/rounded_container.dart';
import 'package:assignment/core/utils/constants/images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodBanners extends StatelessWidget {
  const FoodBanners({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          initialPage: 1,
          height: 130.h,
          viewportFraction: 0.9,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4)),
      items: List.generate(
          3,
          (index) => TRoundedContainer(
                width: 328.w,
                radius: 10.r,
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(AppImages.banner, fit: BoxFit.cover)),
              )),
    );
  }
}
