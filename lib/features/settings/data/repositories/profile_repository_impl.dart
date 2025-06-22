import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/models/user_model.dart';
import 'package:frizter/core/utils/errors_mapper.dart';
import 'package:frizter/features/settings/data/datasources/remote/profile_remote_data_source.dart';
import 'package:frizter/features/settings/domain/repositories/profile_repository.dart';
import 'package:frizter/features/settings/domain/usecases/update_profile_use_case.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepositoryImpl({required this.profileRemoteDataSource});

  @override
  Future<Either<Failure, UserModel>> getUserInfo() async {
    try {
      return Right(await profileRemoteDataSource.getUserInfo());
    } catch (e) {
      debugPrint("Error: $e");
      return Left(ErrorsMapper.handleError(e));
    }
  }

  @override
  Future<Either<Failure, void>> updateEmail(String newEmail) async {
    try {
      return Right(await profileRemoteDataSource.updateEmail(newEmail));
    } catch (e) {
      debugPrint("Error: $e");
      return Left(ErrorsMapper.handleError(e));
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword(String newPassword) async {
    try {
      return Right(await profileRemoteDataSource.updatePassword(newPassword));
    } catch (e) {
      debugPrint("Error: $e");
      return Left(ErrorsMapper.handleError(e));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile(
    UpdateProfileParams params,
  ) async {
    try {
      return Right(await profileRemoteDataSource.updateProfile(params));
    } catch (e) {
      debugPrint("Error: $e");
      return Left(ErrorsMapper.handleError(e));
    }
  }
}
