import 'package:assignment/core/utils/constants/typedefs.dart';

abstract interface class UseCaseWithParams<Type, Params> {
  ResultFuture<Type> call(Params params);
}

abstract interface class UseCaseWithoutParams<Type> {
  ResultFuture<Type> call();
}
