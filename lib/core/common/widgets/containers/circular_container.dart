// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:assignment/core/utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    Key? key,
    this.height = 400,
    this.width = 400,
    this.margin,
    this.backgroundImage,
    this.child,
    this.backgroundColor = AppColors.white,
    this.showBorder = false,
    this.borderColor = AppColors.black,
    this.alignment,
  }) : super(key: key);

  final double? height;
  final double? width;

  final EdgeInsetsGeometry? margin;
  final DecorationImage? backgroundImage;
  final Widget? child;
  final Color backgroundColor;
  final bool showBorder;
  final Color borderColor;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
          image: backgroundImage,
          shape: BoxShape.circle,
          color: backgroundColor,
          border: showBorder ? Border.all(color: borderColor) : null),
      child: child,
    );
  }
}
