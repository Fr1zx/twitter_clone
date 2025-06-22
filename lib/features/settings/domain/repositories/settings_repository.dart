import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/features/settings/domain/entities/settings_entity.dart';

abstract interface class SettingsRepository {
  Future<Either<Failure, SettingsEntity>> getSavedSettings();
  Future<Either<Failure, void>> changeSettings(SettingsEntity settings);
}
