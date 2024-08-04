// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assignment/core/common/widgets/containers/circular_container.dart';

import 'package:assignment/core/common/widgets/containers/rounded_container.dart';
import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/navigators/navigators.dart';
import 'package:assignment/core/utils/styles/text_style.dart';
import 'package:assignment/src/authentication/presentaion/pages/login_with_phone.dart';
import 'package:assignment/src/onboarding/presentaion/cubit/onboarding_cubit.dart';
import 'package:assignment/src/onboarding/presentaion/widgets/onboard1_animation.dart';
import 'package:assignment/src/onboarding/presentaion/widgets/onboard2_animation.dart';
import 'package:assignment/src/onboarding/presentaion/widgets/onboard3_animation.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final currentIndex = state.pageIndex;
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  SizedBox(height: 41.h),

                  // SKIP TO LOGIN SCREEN BUTTON
                  const SkipButton(),

                  // ONBOARDING ANIMATIONS
                  SizedBox(
                    height: 420.h,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: (value) {
                        context.read<OnboardingCubit>().changePage(value);
                      },
                      children: [
                        OnBoardAnimation(
                          animation: SizedBox(
                            height: 280.h,
                            width: 290.w,
                            child: const Onboard1Animation(),
                          ),
                          title: 'Choose & Customize!',
                          subtitle:
                              'Select a platter, choose and customize menu items and craft a personalized menu for event',
                        ),
                        OnBoardAnimation(
                          animation: SizedBox(
                            height: 280.h,
                            width: 290.w,
                            child: const Onboard2Animation(),
                          ),
                          title: 'Order More, Save More!',
                          subtitle:
                              'Experience culinary artistry like never before with our innovative and exquisite cuisine creations',
                        ),
                        const OnBoardAnimation(
                          animation: Onboard3Animation(),
                          title: 'Personal Order Executive',
                          subtitle:
                              'Embark on a personalized culinary journey with our dedicated one-to-one customer support, ensuring a seamless and satisfying experience every step of the way.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.h),

                  // PAGE INDICATOR
                  PageIndicator(currentIndex: currentIndex),
                  SizedBox(height: 20.h),

                  // ANIMATED BUTTON
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 60.h,
                    width: currentIndex == 2 ? 180.w : 60.h,
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    padding: currentIndex == 2
                        ? EdgeInsets.only(right: 8.w, left: 16)
                        : EdgeInsets.zero,
                    alignment: Alignment.center,
                    child: ForwardButton(
                        currentIndex: currentIndex,
                        pageController: _pageController),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ForwardButton extends StatelessWidget {
  const ForwardButton({
    super.key,
    required this.currentIndex,
    required PageController pageController,
  }) : _pageController = pageController;

  final int currentIndex;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: currentIndex == 2
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.center,
      children: [
        currentIndex == 2
            ? Text(
                'Get Started',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    TTextStyle.titleMedium.copyWith(color: AppColors.primary),
              )
            : const SizedBox(),
        SizedBox(height: 8.h),
        TCircularContainer(
          height: 42.h,
          width: 42.h,
          backgroundColor: AppColors.primary,
          child: IconButton(
            onPressed: () {
              if (currentIndex != 2) {
                context.read<OnboardingCubit>().changePage(currentIndex + 1);
                _pageController.animateToPage(
                  currentIndex + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                context.read<OnboardingCubit>().completeOnboarding();
                TNavigators.navigateReplacement(
                    context, const LoginWithPhoneView());
              }
            },
            icon: const Icon(
              Icons.arrow_forward,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          3,
          (index) => TRoundedContainer(
              height: 8.h,
              width: 24.w,
              radius: 5.r,
              margin: const EdgeInsets.only(right: 5),
              backgroundColor: currentIndex == index
                  ? AppColors.primary
                  : AppColors.primary.withOpacity(0.1))),
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          context.read<OnboardingCubit>().completeOnboarding();
          TNavigators.navigateReplacement(context, const LoginWithPhoneView());
        },
        child: TRoundedContainer(
          height: 22.h,
          width: 56.w,
          radius: 4.r,
          backgroundColor: AppColors.primary.withOpacity(0.1),
          alignment: Alignment.center,
          child: Text(
            'Skip',
            textAlign: TextAlign.center,
            style: TTextStyle.titleSmall
                .copyWith(fontSize: 10.sp, color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}

class OnBoardAnimation extends StatelessWidget {
  const OnBoardAnimation({
    super.key,
    required this.title,
    required this.subtitle,
    required this.animation,
  });
  final String title;
  final String subtitle;
  final Widget animation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        animation,
        SizedBox(height: 10.h),
        Text(title, style: TTextStyle.titleLarge),
        SizedBox(height: 8.h),
        Text(
          subtitle,
          // overflow: TextOverflow.ellipsis,
          // maxLines: 3,
          style: TTextStyle.titleMedium.copyWith(
              color: AppColors.textLighter,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
