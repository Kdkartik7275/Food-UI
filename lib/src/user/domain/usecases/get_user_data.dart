import 'package:assignment/core/common/entity/user.dart';
import 'package:assignment/core/common/usecase/usecase.dart';
import 'package:assignment/core/utils/constants/typedefs.dart';
import 'package:assignment/src/user/domain/repository/user_repository.dart';

class GetUserData implements UseCaseWithParams<UserEntity, String> {
  final UserRepository repository;

  GetUserData({required this.repository});

  @override
  ResultFuture<UserEntity> call(String id) async {
    return await repository.getUserData(id);
  }
}
