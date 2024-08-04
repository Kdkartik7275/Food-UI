import 'package:assignment/core/common/errors/failure/failure.dart';

class FirebaseFailure extends Failure {
  FirebaseFailure({required super.message, super.statusCode = 400});
}
