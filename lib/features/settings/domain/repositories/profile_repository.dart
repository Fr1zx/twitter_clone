import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/models/user_model.dart';
import 'package:frizter/features/settings/domain/usecases/update_profile_use_case.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, UserModel>> getUserInfo();
  Future<Either<Failure, void>> updateProfile(UpdateProfileParams params);
  Future<Either<Failure, void>> updateEmail(String newEmail);
  Future<Either<Failure, void>> updatePassword(String newPassword);
}
