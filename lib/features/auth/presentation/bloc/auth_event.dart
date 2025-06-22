part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(LoginParams params) = _Login;
  const factory AuthEvent.register(RegisterParams params) = _Register;
  const factory AuthEvent.resetPassword(String email) = _ResetPassword;
  const factory AuthEvent.logout() = _Logout;
}
