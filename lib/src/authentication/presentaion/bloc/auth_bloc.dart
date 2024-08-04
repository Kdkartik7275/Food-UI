// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:developer';

import 'package:assignment/src/authentication/domain/usecases/get_current_user.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:assignment/src/authentication/domain/usecases/send_code.dart';
import 'package:assignment/src/authentication/domain/usecases/verify_code.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SendCodeToPhoneNumber sendCode;
  final GetCurrentUser getCurrentUser;
  final VerifyCode verifyCode;
  AuthBloc(
      {required this.sendCode,
      required this.verifyCode,
      required this.getCurrentUser})
      : super(AuthInitial()) {
    on<OnCodeSentEvent>(_codeSent);
    on<OnVerifyPhone>(_verifyPhone);
    on<OnCheckLoggedIn>(_isLoggedIn);
  }

  FutureOr<void> _codeSent(
      OnCodeSentEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    if (event.phone.text.length < 10) {
      emit(AuthError(error: 'Invalid Phone Numberr'));
      return;
    }

    final code = await sendCode.call(event.phoneNumber);

    code.fold((error) => emit(AuthError(error: error.message)),
        (verificationID) => emit(CodeSent(verificationID: verificationID)));
  }

  FutureOr<void> _verifyPhone(
      OnVerifyPhone event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final verify = await verifyCode.call(VerifyCodeParams(
        verificationID: event.verificationID, smsCode: event.smsCode));

    verify.fold((error) => emit(AuthError(error: error.message)), (user) {
      if (user.additionalUserInfo!.isNewUser) {
        emit(NewUser(user: user.user!));
      } else {
        emit(Authenticated(user: user.user!));
      }
    });
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    log(change.toString());
  }

  FutureOr<void> _isLoggedIn(
      OnCheckLoggedIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final user = await getCurrentUser.call();
    user.fold((error) => emit(AuthError(error: error.message)), (cred) {
      if (cred != null) {
        emit(Authenticated(user: cred));
      } else {
        emit(UnAuthenticated());
      }
    });
  }
}
