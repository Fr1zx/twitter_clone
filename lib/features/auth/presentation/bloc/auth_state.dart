part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.successfully() = _Successfully;
  const factory AuthState.failure(String error) = _Failure;
}
