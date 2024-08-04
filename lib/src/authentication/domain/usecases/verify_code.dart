import 'package:firebase_auth/firebase_auth.dart';
import 'package:assignment/core/common/usecase/usecase.dart';
import 'package:assignment/core/utils/constants/typedefs.dart';
import 'package:assignment/src/authentication/domain/repository/authentication_repository.dart';

class VerifyCode
    implements UseCaseWithParams<UserCredential, VerifyCodeParams> {
  final AuthRepository repository;

  VerifyCode(this.repository);

  @override
  ResultFuture<UserCredential> call(VerifyCodeParams params) async {
    return await repository.verifyCode(params.verificationID, params.smsCode);
  }
}

class VerifyCodeParams {
  final String verificationID;
  final String smsCode;

  VerifyCodeParams({required this.verificationID, required this.smsCode});
}
