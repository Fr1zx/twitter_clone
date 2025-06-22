import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/usecases/use_case.dart';
import 'package:frizter/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase extends UseCase<void, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});
  @override
  Future<Either<Failure, void>> call(RegisterParams params) {
    return authRepository.register(params);
  }
}

class RegisterParams {
  final String username;
  final String email;
  final String password;

  RegisterParams({
    required this.username,
    required this.email,
    required this.password,
  });
}
