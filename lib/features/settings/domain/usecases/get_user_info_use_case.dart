import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/models/user_model.dart';
import 'package:frizter/core/usecases/use_case.dart';
import 'package:frizter/features/settings/domain/repositories/profile_repository.dart';

class GetUserInfoUseCase extends UseCase<UserModel, NoParams> {
  final ProfileRepository profileRepository;

  GetUserInfoUseCase({required this.profileRepository});
  @override
  Future<Either<Failure, UserModel>> call(NoParams params) {
    return profileRepository.getUserInfo();
  }
}
