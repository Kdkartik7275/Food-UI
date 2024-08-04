import 'package:assignment/core/common/entity/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:assignment/core/common/errors/failure/firebase_failure.dart';
import 'package:assignment/core/common/network/connection_checker.dart';
import 'package:assignment/core/utils/constants/typedefs.dart';
import 'package:assignment/src/user/data/data_source/user_remote_data_source.dart';
import 'package:assignment/src/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ConnectionChecker connectionChecker;
  final UserRemoteDataSource dataSource;

  UserRepositoryImpl(
      {required this.connectionChecker, required this.dataSource});
  @override
  ResultVoid saveUserInfo(
      String userID, String fullName, String email, String phone) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(FirebaseFailure(message: "No Internet Connection"));
      }
      await dataSource.saveUserInfo(email, userID, fullName, phone);
      return right(null);
    } catch (e) {
      return left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<UserEntity> getUserData(String userID) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(FirebaseFailure(message: "No Internet Connection"));
      }
      final user = await dataSource.getUserData(userID);
      return right(user);
    } catch (e) {
      return left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  ResultVoid upadateUserData(String userID, Map<String, dynamic> data) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(FirebaseFailure(message: "No Internet Connection"));
      }
      await dataSource.upadateUserData(userID, data);
      return right(null);
    } catch (e) {
      return left(FirebaseFailure(message: e.toString()));
    }
  }
}
