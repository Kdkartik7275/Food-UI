import 'dart:developer';

import 'package:assignment/core/common/widgets/indicators/circular_progress.dart';
import 'package:assignment/core/utils/navigators/navigators.dart';
import 'package:assignment/src/home/presentation/pages/home_sceen.dart';
import 'package:assignment/src/user/presentation/bloc/user_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assignment/core/utils/constants/colors.dart';
import 'package:assignment/core/utils/styles/text_style.dart';
import 'package:loading_overlay/loading_overlay.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final email = TextEditingController();
  final fullName = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    fullName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserUpadated) {
            // Navigate to Home Screen
            TNavigators.navigateReplacement(context, const HomeSceen());
          } else if (state is UserError) {
            log(state.error);
          }
        },
        builder: (context, state) {
          bool loading = state is UserLoading;
          return LoadingOverlay(
            isLoading: state is StoringUser,
            progressIndicator: circularProgress(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Just a step away !',
                        style: TTextStyle.titleLarge,
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 40.h,
                        child: TextField(
                          controller: fullName,
                          decoration: InputDecoration(
                              hintText: 'Full Name',
                              hintStyle: GoogleFonts.lexend(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textLighter),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: const BorderSide(
                                      color: AppColors.filledTextField))),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      SizedBox(
                        height: 40.h,
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                              hintText: 'Email ID',
                              hintStyle: GoogleFonts.lexend(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textLighter),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: const BorderSide(
                                      color: AppColors.filledTextField))),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        if (fullName.text.trim().isNotEmpty &&
                            email.text.trim().isNotEmpty) {
                          context.read<UserBloc>().add(
                                  OnUpdateUserData(
                                      userID: FirebaseAuth
                                          .instance.currentUser!.uid,
                                      data: {
                                    'fullName': fullName.text,
                                    'email': email.text.trim()
                                  }));
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        height: loading ? 50.h : 44.sp,
                        width: loading ? 55.w : 327.w,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius:
                                BorderRadius.circular(loading ? 100.r : 10.r)),
                        alignment: Alignment.center,
                        child: loading
                            ? const CircularProgressIndicator(
                                color: AppColors.white)
                            : Text(
                                'Let’s Start',
                                style: GoogleFonts.lexend(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white),
                              ),
                      ),
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
