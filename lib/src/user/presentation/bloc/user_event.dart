part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

final class OnSaveUserInfo extends UserEvent {
  final UserEntity user;

  const OnSaveUserInfo({required this.user});
}

final class OnGetUserData extends UserEvent {
  final String userID;

  const OnGetUserData({required this.userID});
}

final class OnUpdateUserData extends UserEvent {
  final String userID;
  final Map<String, dynamic> data;

  const OnUpdateUserData({required this.userID, required this.data});
}
