// ignore: must_be_immutable
import 'package:assignment/core/common/widgets/containers/rounded_container.dart';
import 'package:assignment/core/utils/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class DetailBox extends StatelessWidget {
  DetailBox(
      {super.key,
      this.height,
      this.width,
      this.boxShadow,
      required this.image,
      required this.label,
      this.imageBorder = const BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      this.fit});

  double? height;
  double? width;
  List<BoxShadow>? boxShadow;
  String image;
  String label;
  BoxFit? fit;
  final BorderRadius imageBorder;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      radius: 10.r,
      boxShadow: boxShadow,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: imageBorder,
            child: Image.asset(
              image,
              width: width,
              fit: fit,
            ),
          ),
          SizedBox(height: 8.h),
          Text(label,
              style:
                  TTextStyle.titleSmall.copyWith(fontWeight: FontWeight.w400))
        ],
      ),
    );
  }
}
