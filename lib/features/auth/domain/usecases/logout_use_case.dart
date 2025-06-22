import 'package:dartz/dartz.dart';
import 'package:frizter/app/di/di.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/usecases/use_case.dart';

class LogoutUseCase extends UseCase<void, NoParams> {
  final AuthRepository authRepository;

  LogoutUseCase({required this.authRepository});
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return authRepository.logout();
  }
}
