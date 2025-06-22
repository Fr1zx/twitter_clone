part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.loaded({required SettingsEntity settings}) = _Loaded;
  const factory SettingsState.failure(String error) = _Failure;
}
