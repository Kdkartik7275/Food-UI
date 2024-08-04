part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class StoringUser extends UserState {}

final class UserCreated extends UserState {}

final class UserUpadated extends UserState {}

final class UserLoaded extends UserState {
  final UserEntity user;

  const UserLoaded({required this.user});
}

final class UserError extends UserState {
  final String error;

  const UserError({required this.error});
}
