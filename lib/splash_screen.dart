import 'package:assignment/bottom_navigation.dart';
import 'package:assignment/core/utils/constants/images.dart';
import 'package:assignment/core/utils/navigators/navigators.dart';
import 'package:assignment/core/utils/styles/text_style.dart';
import 'package:assignment/src/authentication/presentaion/bloc/auth_bloc.dart';
import 'package:assignment/src/authentication/presentaion/pages/login_with_phone.dart';
import 'package:assignment/src/onboarding/presentaion/cubit/onboarding_cubit.dart';
import 'package:assignment/src/onboarding/presentaion/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  bool _showSecondScreen = false;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _scaleAnimation = Tween<double>(begin: 1.0, end: 2).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showSecondScreen = true;
      });
      _scaleController.forward().then((_) {
        checkForOnboarding();
      });
    });
  }

  checkForOnboarding() async {
    final status =
        await context.read<OnboardingCubit>().checkOnboardingStatus();
    if (!mounted) return;
    if (status) {
      context.read<AuthBloc>().add(OnCheckLoggedIn());
    } else {
      TNavigators.navigateReplacement(context, OnboardingView());
    }
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            TNavigators.navigateReplacement(
                context, const BottomNavigationView());
          } else if (state is UnAuthenticated) {
            TNavigators.navigateReplacement(
                context, const LoginWithPhoneView());
          }
        },
        child: Stack(
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                AppImages.bg,
                fit: BoxFit.cover,
                height: 812.h,
                width: 796.w,
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.logo,
                    height: 110.h,
                    width: 88.w,
                    fit: BoxFit.contain,
                  ),
                  _showSecondScreen
                      ? SlideTransition(
                          position: _slideAnimation,
                          child: FadeTransition(
                            opacity: _scaleController
                                .drive(Tween<double>(begin: 0, end: 1)),
                            child: Column(
                              children: [
                                Text(
                                  'Craft My Plate',
                                  style: TTextStyle.headlineLarge.copyWith(
                                      color: const Color(0xffF7E5B7),
                                      fontWeight: FontWeight.w400),
                                ),
                                Text('You customise, We cater',
                                    style: TTextStyle.titleMedium.copyWith(
                                        color: const Color(0xffF7E5B7),
                                        letterSpacing: 1.sp,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                        )
                      : Text(
                          'Welcome',
                          style: TTextStyle.headlineLarge.copyWith(
                              color: const Color(0xffF7E5B7),
                              fontWeight: FontWeight.w400),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
