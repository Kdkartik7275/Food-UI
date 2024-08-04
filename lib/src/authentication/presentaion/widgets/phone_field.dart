import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assignment/core/common/widgets/containers/rounded_container.dart';
import 'package:assignment/core/common/widgets/fields/text_field.dart';
import 'package:assignment/core/utils/constants/colors.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TRoundedContainer(
        height: 50.h,
        showBorder: true,
        radius: 10.r,
        borderColor: AppColors.border,
        alignment: Alignment.center,
        child:
            TTextField(controller: controller, hintText: 'Enter Phone Number'),
      ),
    );
  }
}
