part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadUser() = _LoadUser;
  const factory ProfileEvent.changeEmail(String newEmail) = _ChangeEmail;
  const factory ProfileEvent.changePassword(String newPassword) =
      _ChangePassword;
  const factory ProfileEvent.updateProfile(UpdateProfileParams params) =
      _UpdateProfile;

}
