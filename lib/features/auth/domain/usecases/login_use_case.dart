import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/usecases/use_case.dart';
import 'package:frizter/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase extends UseCase<void, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});
  @override
  Future<Either<Failure, void>> call(LoginParams params) {
    return authRepository.login(params);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
