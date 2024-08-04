import 'package:assignment/core/common/usecase/usecase.dart';
import 'package:assignment/core/utils/constants/typedefs.dart';
import 'package:assignment/src/user/domain/repository/user_repository.dart';

class UpdateUserData implements UseCaseWithParams<void, UpdateUserDataParams> {
  final UserRepository repository;

  UpdateUserData({required this.repository});

  @override
  ResultFuture<void> call(UpdateUserDataParams params) async {
    return await repository.upadateUserData(params.userId, params.data);
  }
}

class UpdateUserDataParams {
  final String userId;
  final Map<String, dynamic> data;

  UpdateUserDataParams({required this.userId, required this.data});
}
