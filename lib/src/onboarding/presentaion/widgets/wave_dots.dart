import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaveDots extends StatefulWidget {
  const WaveDots({super.key});

  @override
  _WaveDotsState createState() => _WaveDotsState();
}

class _WaveDotsState extends State<WaveDots>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return Row(
          children: List.generate(3, (index) {
            return Transform.translate(
              offset: Offset(
                  0,
                  -6 *
                      (1 -
                          Curves.easeInOut.transform(
                            (_controller!.value + index / 3) % 1,
                          ))),
              child: Opacity(
                opacity: 1 -
                    (0.5 *
                        (1 -
                            Curves.easeInOut.transform(
                              (_controller!.value + index / 3) % 1,
                            ))),
                child: const Dot(),
              ),
            );
          }),
        );
      },
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4.w,
      height: 4.h,
      margin: const EdgeInsets.only(right: 3),
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
