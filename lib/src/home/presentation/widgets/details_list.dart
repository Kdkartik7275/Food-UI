import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsList extends StatelessWidget {
  const DetailsList({
    super.key,
    required this.details,
  });

  final List<String> details;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          details.length,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: 3.h),
            child: Text(details[index],
                style: GoogleFonts.lexend(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff474747))),
          ),
        ));
  }
}
