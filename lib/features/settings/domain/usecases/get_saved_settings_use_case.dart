import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/usecases/use_case.dart';
import 'package:frizter/features/settings/domain/entities/settings_entity.dart';
import 'package:frizter/features/settings/domain/repositories/settings_repository.dart';

class GetSavedSettingsUseCase extends UseCase<SettingsEntity, NoParams> {
  final SettingsRepository settingsRepository;

  GetSavedSettingsUseCase({required this.settingsRepository});
  @override
  Future<Either<Failure, SettingsEntity>> call(NoParams params) {
    return settingsRepository.getSavedSettings();
  }

}
