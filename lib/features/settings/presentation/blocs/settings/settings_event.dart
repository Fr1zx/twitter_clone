part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.getSavedSettings() = _GetSavedSettings;
  const factory SettingsEvent.changeTheme() = _ChangeTheme;
  const factory SettingsEvent.changeNotifications() = _ChangeNotifications;
}
