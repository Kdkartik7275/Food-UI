part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class OnCodeSentEvent extends AuthEvent {
  final String phoneNumber;
  final TextEditingController phone;

  OnCodeSentEvent({required this.phoneNumber, required this.phone});
}

final class OnVerifyPhone extends AuthEvent {
  final String verificationID;
  final String smsCode;

  OnVerifyPhone({
    required this.verificationID,
    required this.smsCode,
  });
}

final class OnCheckLoggedIn extends AuthEvent {}
