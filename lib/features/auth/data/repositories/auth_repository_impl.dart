import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/utils/errors_mapper.dart';
import 'package:frizter/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:frizter/features/auth/domain/repositories/auth_repository.dart';
import 'package:frizter/features/auth/domain/usecases/login_use_case.dart';
import 'package:frizter/features/auth/domain/usecases/register_use_case.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, void>> login(LoginParams params) async {
    try {
      return Right(await authRemoteDataSource.login(params));
    } catch (e) {
      debugPrint("Error: $e");
      return Left(ErrorsMapper.handleError(e));
    }
  }

  @override
  Future<Either<Failure, void>> register(RegisterParams params) async {
    try {
      return Right(await authRemoteDataSource.register(params));
    } catch (e) {
      debugPrint("Error: $e");
      return Left(ErrorsMapper.handleError(e));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      return Right(await authRemoteDataSource.resetPassword(email));
    } catch (e) {
      debugPrint("Error: $e");
      return Left(ErrorsMapper.handleError(e));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      return Right(await authRemoteDataSource.logout());
    } catch (e) {
      debugPrint("Error: $e");
      return Left(ErrorsMapper.handleError(e));
    }
  }
}
