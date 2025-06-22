import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/usecases/use_case.dart';
import 'package:frizter/features/settings/domain/repositories/profile_repository.dart';

class UpdatePasswordUseCase extends UseCase<void, String> {
  final ProfileRepository profileRepository;

  UpdatePasswordUseCase({required this.profileRepository});
  @override
  Future<Either<Failure, void>> call(String newPassword) {
    return profileRepository.updatePassword(newPassword);
  }
}
