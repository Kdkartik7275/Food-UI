// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:assignment/core/common/errors/failure/firebase_failure.dart';

import 'package:assignment/core/common/network/connection_checker.dart';
import 'package:assignment/core/utils/constants/typedefs.dart';
import 'package:assignment/src/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:assignment/src/authentication/domain/repository/authentication_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ConnectionChecker connectionChecker;

  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.connectionChecker,
    required this.remoteDataSource,
  });

  @override
  ResultFuture<String> sendCodeToPhoneNumber(String phoneNumber) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(FirebaseFailure(message: "No Internet Connection"));
      }
      final verification =
          await remoteDataSource.sendCodeToPhoneNumber(phoneNumber);

      return right(verification);
    } catch (e) {
      return left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<UserCredential> verifyCode(
      String verificationId, String smsCode) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(FirebaseFailure(message: "No Internet Connection"));
      }
      final userCredential =
          await remoteDataSource.verifyCode(verificationId, smsCode);

      return right(userCredential);
    } catch (e) {
      return left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<User?> getCurrentUser() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(FirebaseFailure(message: "No Internet Connection"));
      }
      final userCredential = await remoteDataSource.getCurrentUser();

      return right(userCredential);
    } catch (e) {
      return left(FirebaseFailure(message: e.toString()));
    }
  }
}
