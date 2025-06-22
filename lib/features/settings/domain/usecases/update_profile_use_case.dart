import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/usecases/use_case.dart';
import 'package:frizter/features/settings/domain/repositories/profile_repository.dart';

class UpdateProfileUseCase extends UseCase<void, UpdateProfileParams> {
  final ProfileRepository profileRepository;

  UpdateProfileUseCase({required this.profileRepository});
  @override
  Future<Either<Failure, void>> call(UpdateProfileParams params) {
    return profileRepository.updateProfile(params);
  }
}

class UpdateProfileParams {
  final String username;
  final String bio;
  final String? newPhoto;

  UpdateProfileParams({
    required this.username,
    required this.bio,
    required this.newPhoto,
  });
}
