import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/usecases/use_case.dart';
import 'package:frizter/features/settings/domain/repositories/profile_repository.dart';

class UpdateEmailUseCase extends UseCase<void, String> {
  final ProfileRepository profileRepository;

  UpdateEmailUseCase({required this.profileRepository});
  @override
  Future<Either<Failure, void>> call(String email) {
    return profileRepository.updateEmail(email);
  }
}
