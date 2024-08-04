import 'package:fpdart/fpdart.dart';
import 'package:assignment/core/common/errors/failure/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = Future<Either<Failure, void>>;
