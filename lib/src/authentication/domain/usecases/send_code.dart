import 'package:assignment/core/common/usecase/usecase.dart';
import 'package:assignment/core/utils/constants/typedefs.dart';
import 'package:assignment/src/authentication/domain/repository/authentication_repository.dart';

class SendCodeToPhoneNumber implements UseCaseWithParams<void, String> {
  final AuthRepository repository;

  SendCodeToPhoneNumber(this.repository);

  @override
  ResultFuture<String> call(String phoneNumber) async {
    return await repository.sendCodeToPhoneNumber(phoneNumber);
  }
}
