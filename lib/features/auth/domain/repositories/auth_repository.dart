import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/features/auth/domain/usecases/login_use_case.dart';
import 'package:frizter/features/auth/domain/usecases/register_use_case.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, void>> login(LoginParams params);
  Future<Either<Failure, void>> register(RegisterParams params);
  Future<Either<Failure, void>> resetPassword(String email);
  Future<Either<Failure, void>> logout();
}
