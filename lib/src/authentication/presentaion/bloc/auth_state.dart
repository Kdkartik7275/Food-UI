part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class UnAuthenticated extends AuthState {}

final class Authenticated extends AuthState {
  final User user;

  Authenticated({required this.user});
}

final class NewUser extends AuthState {
  final User user;

  NewUser({required this.user});
}

final class AuthError extends AuthState {
  final String error;

  AuthError({required this.error});
}

final class CodeSent extends AuthState {
  final String verificationID;

  CodeSent({required this.verificationID});
}
