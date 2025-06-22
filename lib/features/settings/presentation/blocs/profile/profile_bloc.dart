import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frizter/core/models/user_model.dart';
import 'package:frizter/core/usecases/use_case.dart';
import 'package:frizter/features/settings/domain/usecases/get_user_info_use_case.dart';
import 'package:frizter/features/auth/domain/usecases/logout_use_case.dart';
import 'package:frizter/features/settings/domain/usecases/update_email_use_case.dart';
import 'package:frizter/features/settings/domain/usecases/update_password_use_case.dart';
import 'package:frizter/features/settings/domain/usecases/update_profile_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserInfoUseCase getUserInfoUseCase;
  final LogoutUseCase logoutUseCase;
  final UpdateEmailUseCase updateEmailUseCase;
  final UpdatePasswordUseCase updatePasswordUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileBloc({
    required this.getUserInfoUseCase,
    required this.logoutUseCase,
    required this.updateEmailUseCase,
    required this.updatePasswordUseCase,
    required this.updateProfileUseCase,
  }) : super(_Initial()) {
    on<_LoadUser>(_loadUser);
    on<_ChangeEmail>(_changeEmail);
    on<_ChangePassword>(_changePassword);
    on<_UpdateProfile>(_changeProfile);
  }
  _loadUser(_LoadUser event, Emitter<ProfileState> emit) async {
    emit(ProfileState.loading());
    final userOrFailure = await getUserInfoUseCase.call(NoParams());
    userOrFailure.fold(
      (error) => emit(ProfileState.failure(error: error.message)),
      (user) => emit(ProfileState.loaded(user)),
    );
  }

  _changeEmail(_ChangeEmail event, Emitter<ProfileState> emit) async {
    UserModel? currentUser;
    if (state is _Loaded) {
      final loadedState = state as _Loaded;

      currentUser = loadedState.userModel;
    } else if (state is _Failure) {
      final failureState = state as _Failure;

      currentUser = failureState.user;
    }
    emit(ProfileState.loading());
    final updatedOrFailure = await updateEmailUseCase.call(event.newEmail);
    updatedOrFailure.fold(
      (error) =>
          emit(ProfileState.failure(error: error.message, user: currentUser)),
      (_) {
        if (state is _Loaded) {
          emit(
            ProfileState.loaded(
              (state as _Loaded).userModel.copyWith(
                email: "${event.newEmail}(not confirmed)",
              ),
            ),
          );
        }
      },
    );
  }

  _changePassword(_ChangePassword event, Emitter<ProfileState> emit) async {
    UserModel? currentUser;
    if (state is _Loaded) {
      final loadedState = state as _Loaded;

      currentUser = loadedState.userModel;
    } else if (state is _Failure) {
      final failureState = state as _Failure;

      currentUser = failureState.user;
    }
    emit(ProfileState.loading());

    final changeOrFailure = await updatePasswordUseCase.call(event.newPassword);
    changeOrFailure.fold(
      (error) =>
          emit(ProfileState.failure(error: error.message, user: currentUser)),
      (_) {
        if (state is _Loading) {
          emit(ProfileState.loaded((state as _Loaded).userModel));
        }
      },
    );
  }

  _changeProfile(_UpdateProfile event, Emitter<ProfileState> emit) async {
    UserModel? currentUser;
    if (state is _Loaded) {
      final loadedState = state as _Loaded;

      currentUser = loadedState.userModel;
    } else if (state is _Failure) {
      final failureState = state as _Failure;

      currentUser = failureState.user;
    }
    emit(ProfileState.loading());

    final updateProfileOrFailure = await updateProfileUseCase.call(
      event.params,
    );
    updateProfileOrFailure.fold(
      (error) =>
          emit(ProfileState.failure(error: error.message, user: currentUser)),
      (_) => add(_LoadUser()),
    );
  }


}
