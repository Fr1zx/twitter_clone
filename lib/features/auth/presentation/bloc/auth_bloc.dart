import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frizter/app/di/di.dart';
import 'package:frizter/core/usecases/use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final LogoutUseCase logoutUseCase;
  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.resetPasswordUseCase,
    required this.logoutUseCase,
  }) : super(AuthState.initial()) {
    on<_Login>(_login);
    on<_Register>(_register);
    on<_ResetPassword>(_resetPassword);
    on<_Logout>(_logout);
  }

  _login(_Login event, Emitter<AuthState> emit) async {
    emit(AuthState.loading());
    final loginOrFailure = await loginUseCase(event.params);
    loginOrFailure.fold(
      (error) => emit(AuthState.failure(error.message)),
      (_) => emit(AuthState.successfully()),
    );
  }

  _register(_Register event, Emitter<AuthState> emit) async {
    emit(AuthState.loading());

    final registerOrFailure = await registerUseCase(event.params);
    registerOrFailure.fold(
      (error) => emit(AuthState.failure(error.message)),
      (_) => emit(AuthState.successfully()),
    );
  }

  _resetPassword(_ResetPassword event, Emitter<AuthState> emit) async {
    emit(AuthState.loading());
    final resetPasswordOrFailure = await resetPasswordUseCase(event.email);
    resetPasswordOrFailure.fold(
      (error) => emit(AuthState.failure(error.message)),
      (_) => emit(AuthState.successfully()),
    );
  }

  _logout(_Logout event, Emitter<AuthState> emit) async {
    final logoutOrFailure = await logoutUseCase.call(NoParams());
    logoutOrFailure.fold(
      (error) => emit(AuthState.failure(error.message)),
      (_) => (),
    );
  }
}
