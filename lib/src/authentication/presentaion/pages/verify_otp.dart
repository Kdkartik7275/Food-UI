// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:assignment/bottom_navigation.dart';
import 'package:assignment/core/common/entity/user.dart';
import 'package:assignment/core/utils/navigators/navigators.dart';
import 'package:assignment/src/authentication/presentaion/pages/user_info.dart';
import 'package:assignment/src/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:pinput/pinput.dart';

import 'package:assignment/core/common/widgets/indicators/circular_progress.dart';
import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/constants/images.dart';
import 'package:assignment/core/utils/styles/text_style.dart';
import 'package:assignment/src/authentication/presentaion/bloc/auth_bloc.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({
    super.key,
    required this.verificationID,
    required this.phone,
  });

  final String verificationID;
  final String phone;

  @override
  Widget build(BuildContext context) {
    final countryCode = phone.split(' ')[0];
    final number = phone.split(' ')[1];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          'OTP Verfication',
          style: TTextStyle.titleSmall.copyWith(letterSpacing: 1),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            TNavigators.navigateReplacement(
                context, const BottomNavigationView());
          } else if (state is NewUser) {
            context.read<UserBloc>().add(OnSaveUserInfo(
                user: UserEntity(
                    email: '',
                    fullName: '',
                    phone: phone,
                    userID: state.user.uid)));
            TNavigators.navigateReplacement(context, const UserInfo());
          } else if (state is AuthError) {
            log(state.error);
          }
        },
        builder: (context, state) {
          return LoadingOverlay(
            isLoading: state is AuthLoading,
            progressIndicator: circularProgress(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView(
                children: [
                  SizedBox(height: 40.h),
                  Text('We have sent a verification code to',
                      style: GoogleFonts.lexend(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textLighter)),
                  SizedBox(height: 8.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$countryCode-XXXXXX${number.substring(6)}',
                          style: GoogleFonts.lexend(
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black)),
                      SizedBox(width: 5.w),
                      Image.asset(AppImages.verified)
                    ],
                  ),

                  // OTP FIELD
                  SizedBox(height: 16.h),

                  Pinput(
                    length: 6,
                    autofocus: true,
                    onCompleted: (otp) {
                      context.read<AuthBloc>().add(OnVerifyPhone(
                          verificationID: verificationID, smsCode: otp));
                    },
                    defaultPinTheme: PinTheme(
                      width: 56.h,
                      height: 56.w,
                      textStyle: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600),
                      decoration: const BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: AppColors.border)),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Didn’t receive code? ',
                      style: GoogleFonts.lexend(
                          color: AppColors.textLighter,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Resend Again.',
                          style: GoogleFonts.lexend(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle Privacy Policy tap
                            },
                        ),
                      ],
                    ),
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
