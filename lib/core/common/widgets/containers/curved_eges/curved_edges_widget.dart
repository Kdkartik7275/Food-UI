import 'package:flutter/material.dart';
import 'package:assignment/core/utils/constants/colors.dart';

class BottomRadiusPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 32)
      ..arcToPoint(
        Offset(32, size.height),
        radius: Radius.circular(32),
        clockwise: false,
      )
      ..lineTo(size.width - 32, size.height)
      ..arcToPoint(
        Offset(size.width, size.height - 32),
        radius: Radius.circular(32),
        clockwise: false,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
