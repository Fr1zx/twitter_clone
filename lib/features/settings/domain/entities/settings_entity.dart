import 'package:freezed_annotation/freezed_annotation.dart';
part 'settings_entity.freezed.dart';
@freezed
class SettingsEntity with _$SettingsEntity{
  const factory SettingsEntity({
    required bool isDarkMode,
    required bool isNotificationsAllowed,
  }) = _SettingsEntity;

}
