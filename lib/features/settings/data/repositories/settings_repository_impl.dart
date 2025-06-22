import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/utils/errors_mapper.dart';
import 'package:frizter/features/settings/data/datasources/local/settings_local_data_source.dart';
import 'package:frizter/features/settings/data/datasources/remote/settings_remote_data_source.dart';
import 'package:frizter/features/settings/data/models/settings_model.dart';
import 'package:frizter/features/settings/domain/entities/settings_entity.dart';
import 'package:frizter/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteDataSource settingsRemoteDataSource;
  final SettingsLocalDataSource settingsLocalDataSource;

  SettingsRepositoryImpl({
    required this.settingsRemoteDataSource,
    required this.settingsLocalDataSource,
  });

  @override
  Future<Either<Failure, void>> changeSettings(SettingsEntity settings) async {
    try {
      return Right(
        await settingsLocalDataSource.changeSettings(
          SettingsModel.fromEntity(settings),
        ),
      );
    } catch (e) {
      debugPrint("Error: $e");
      return Left(ErrorsMapper.handleError(e));
    }
  }

  @override
  Future<Either<Failure, SettingsEntity>> getSavedSettings() async {
    try {
      final settings = await settingsLocalDataSource.getSavedSettings();
      return Right(settings.toEntity());
    } catch (e) {
      debugPrint("Error: $e");
      return Left(ErrorsMapper.handleError(e));
    }
  }
}
