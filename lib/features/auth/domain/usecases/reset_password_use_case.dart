import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/usecases/use_case.dart';
import 'package:frizter/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase extends UseCase<void, String> {
  final AuthRepository authRepository;

  ResetPasswordUseCase({required this.authRepository});
  @override
  Future<Either<Failure, void>> call(String email) {
    return authRepository.resetPassword(email);
  }
}
