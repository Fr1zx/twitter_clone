part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.loaded(UserModel userModel) = _Loaded;
  const factory ProfileState.failure({required String error, UserModel? user}) = _Failure;
}
