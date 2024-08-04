// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:assignment/core/common/entity/user.dart';
import 'package:assignment/src/user/domain/usecases/get_user_data.dart';
import 'package:assignment/src/user/domain/usecases/save_user_info.dart';
import 'package:assignment/src/user/domain/usecases/update_data.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final SaveUserInfo saveUserInfo;
  final GetUserData getUserData;
  final UpdateUserData updateUserData;
  UserBloc(
    this.saveUserInfo,
    this.getUserData,
    this.updateUserData,
  ) : super(UserInitial()) {
    on<OnSaveUserInfo>(_saveUserInfo);
    on<OnGetUserData>(_getUserData);
    on<OnUpdateUserData>(_updateUserData);
  }

  FutureOr<void> _saveUserInfo(
      OnSaveUserInfo event, Emitter<UserState> emit) async {
    emit(StoringUser());

    final data = await saveUserInfo.call(SaveUserInfoParams(
        userID: event.user.userID!,
        email: event.user.email!,
        fullName: event.user.fullName!,
        phone: event.user.phone!));

    data.fold((eror) => emit(UserError(error: eror.message)),
        (_) => emit(UserCreated()));
  }

  FutureOr<void> _updateUserData(
      OnUpdateUserData event, Emitter<UserState> emit) async {
    emit(UserLoading());

    final user = await updateUserData
        .call(UpdateUserDataParams(userId: event.userID, data: event.data));
    user.fold((error) => emit(UserError(error: error.message)),
        (user) => emit(UserUpadated()));
  }

  FutureOr<void> _getUserData(
      OnGetUserData event, Emitter<UserState> emit) async {
    emit(UserLoading());

    final user = await getUserData.call(event.userID);
    user.fold((error) => emit(UserError(error: error.message)),
        (user) => emit(UserLoaded(user: user)));
  }
}
