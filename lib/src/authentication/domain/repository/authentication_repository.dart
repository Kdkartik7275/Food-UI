// domain/repositories/auth_repository.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:assignment/core/utils/constants/typedefs.dart';

abstract class AuthRepository {
  ResultFuture<String> sendCodeToPhoneNumber(String phoneNumber);
  ResultFuture<UserCredential> verifyCode(
      String verificationId, String smsCode);

  ResultFuture<User?> getCurrentUser();
}
