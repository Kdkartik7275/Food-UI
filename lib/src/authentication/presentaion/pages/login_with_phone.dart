// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:assignment/core/utils/navigators/navigators.dart';
import 'package:assignment/src/authentication/presentaion/pages/verify_otp.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:assignment/core/common/widgets/containers/rounded_container.dart';
import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/styles/text_style.dart';
import 'package:assignment/src/authentication/presentaion/bloc/auth_bloc.dart';
import 'package:assignment/src/authentication/presentaion/widgets/login_header.dart';
import 'package:assignment/src/authentication/presentaion/widgets/phone_field.dart';
import 'package:assignment/src/authentication/presentaion/widgets/terms_conditions.dart';

class LoginWithPhoneView extends StatefulWidget {
  const LoginWithPhoneView({super.key});

  @override
  State<LoginWithPhoneView> createState() => _LoginWithPhoneViewState();
}

class _LoginWithPhoneViewState extends State<LoginWithPhoneView> {
  late Country selectedCountry;

  final phone = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedCountry = Country(
        phoneCode: "91",
        countryCode: "IN",
        e164Sc: 0,
        geographic: true,
        level: 1,
        name: "India",
        example: "India",
        displayName: "India",
        displayNameNoCountryCode: "IN",
        e164Key: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is CodeSent) {
            TNavigators.navigatePush(
                context,
                VerifyOtp(
                  verificationID: state.verificationID,
                  phone: '+${selectedCountry.phoneCode} ${phone.text}',
                ));
          } else if (state is AuthError) {
            log(state.error);
          }
        },
        builder: (context, state) {
          bool loading = state is AuthLoading;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                const LoginHeader(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        'Log In or Sign Up with Craft My Plate',
                        style: TTextStyle.titleSmall,
                      ),
                      SizedBox(height: 20.h),

                      // COUNTRY SELECTOR AND MOBILE FIELD
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showCountryPicker(
                                  context: context,
                                  onSelect: (country) {
                                    setState(() {
                                      selectedCountry = country;
                                    });
                                  });
                            },
                            child: TRoundedContainer(
                              height: 50.h,
                              width: 55.w,
                              showBorder: true,
                              radius: 10.r,
                              borderColor: AppColors.border,
                              alignment: Alignment.center,
                              child: Text(
                                "+${selectedCountry.phoneCode}",
                                style: GoogleFonts.lexend(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          PhoneTextField(controller: phone)
                        ],
                      ),
                      SizedBox(height: 16.h),

                      // LOGIN BUTTON

                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            context.read<AuthBloc>().add(OnCodeSentEvent(
                                phoneNumber:
                                    '+${selectedCountry.phoneCode} ${phone.text}',
                                phone: phone));
                          },
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            height: loading ? 50.h : 44.sp,
                            width: loading ? 55.w : 327.w,
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(
                                    loading ? 100.r : 10.r)),
                            alignment: Alignment.center,
                            child: loading
                                ? const CircularProgressIndicator(
                                    color: AppColors.white)
                                : Text(
                                    'Continue',
                                    style: TTextStyle.titleSmall.copyWith(
                                        color: AppColors.white,
                                        letterSpacing: 1.5),
                                  ),
                          ),
                        ),
                      ),

                      // TERMS AND CONDITIONS
                      SizedBox(height: 25.h),
                      const TermsAndConditions(),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
