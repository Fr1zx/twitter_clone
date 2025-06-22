import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/usecases/use_case.dart';
import 'package:frizter/features/settings/domain/entities/settings_entity.dart';
import 'package:frizter/features/settings/domain/repositories/settings_repository.dart';

class ChangeSettingsUseCase extends UseCase<void, SettingsEntity> {
  final SettingsRepository settingsRepository;

  ChangeSettingsUseCase({required this.settingsRepository});
  @override
  Future<Either<Failure, void>> call(SettingsEntity newSettings) {
    return settingsRepository.changeSettings(newSettings);
  }
}
