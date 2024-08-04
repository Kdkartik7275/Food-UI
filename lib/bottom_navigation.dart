import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/constants/images.dart';
import 'package:assignment/src/home/presentation/pages/home_sceen.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView>
    with TickerProviderStateMixin {
  int _page = 0;
  List<String> icons = [
    AppImages.home,
    AppImages.heart,
    AppImages.orders,
    AppImages.profile,
  ];

  List<String> labels = [
    'Home',
    'Wishlist',
    'Orders',
    'Profile',
  ];

  List<Widget> pages = [
    const HomeSceen(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      floatingActionButton: SizedBox(
        height: 60.h,
        width: 60.w,
        child: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(
              side: BorderSide(color: Color(0xffF7C74C), width: 2)),
          backgroundColor: AppColors.primary,
          child: Image.asset(
            AppImages.logo,
            height: 36.h,
            width: 36.w,
            alignment: Alignment.center,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        gapLocation: GapLocation.center,
        height: 70.h,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        itemCount: icons.length,
        tabBuilder: (int index, bool isActive) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icons[index],
                fit: BoxFit.cover,
                height: 20.h,
                width: 20.w,
                color: _page == index
                    ? AppColors.primary
                    : const Color(0xff8E8E8E),
              ),
              Text(
                labels[index],
                style: GoogleFonts.lexend(
                  fontSize: 12.sp,
                  color: _page == index
                      ? AppColors.primary
                      : const Color(0xff8E8E8E),
                ),
              ),
            ],
          );
        },
        activeIndex: _page,
        onTap: (index) => setState(() => _page = index),
        hideAnimationCurve: Curves.linear,
      ),
    );
  }
}
