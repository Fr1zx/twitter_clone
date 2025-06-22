sealed class Failure {
  final String message;

  Failure({required this.message});
}

final class AuthFailure extends Failure {
  AuthFailure({required super.message});
}

final class ServerFailure extends Failure {
  ServerFailure({required super.message});
}

final class CachedFailure extends Failure {
  CachedFailure({required super.message});
}

final class UnkownFailure extends Failure {
  UnkownFailure({required super.message});
}
