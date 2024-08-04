import 'package:assignment/core/common/entity/user.dart';
import 'package:assignment/core/utils/constants/typedefs.dart';

abstract interface class UserRepository {
  ResultVoid saveUserInfo(
      String userID, String fullName, String email, String phone);

  ResultVoid upadateUserData(String userID, Map<String, dynamic> data);

  ResultFuture<UserEntity> getUserData(String userID);
}
