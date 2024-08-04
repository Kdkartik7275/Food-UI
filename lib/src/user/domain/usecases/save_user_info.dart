import 'package:assignment/core/common/usecase/usecase.dart';
import 'package:assignment/core/utils/constants/typedefs.dart';
import 'package:assignment/src/user/domain/repository/user_repository.dart';

class SaveUserInfo implements UseCaseWithParams<void, SaveUserInfoParams> {
  final UserRepository repository;

  SaveUserInfo({required this.repository});
  @override
  ResultFuture<void> call(SaveUserInfoParams params) async {
    return await repository.saveUserInfo(
        params.userID, params.fullName, params.email, params.phone);
  }
}

class SaveUserInfoParams {
  final String userID;
  final String email;
  final String fullName;
  final String phone;

  SaveUserInfoParams(
      {required this.userID,
      required this.email,
      required this.fullName,
      required this.phone});
}
