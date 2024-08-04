import 'package:assignment/core/common/usecase/usecase.dart';
import 'package:assignment/core/utils/constants/typedefs.dart';
import 'package:assignment/src/authentication/domain/repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetCurrentUser implements UseCaseWithoutParams<User?> {
  final AuthRepository repository;

  GetCurrentUser({required this.repository});

  @override
  ResultFuture<User?> call() async {
    return await repository.getCurrentUser();
  }
}
