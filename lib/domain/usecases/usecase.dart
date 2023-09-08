import 'package:dartz/dartz.dart';
import 'package:test_app_effective/common/errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseRight<Type, Params> {
  Future<Type> call(Params params);
}
