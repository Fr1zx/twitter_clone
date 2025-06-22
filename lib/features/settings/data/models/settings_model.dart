import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frizter/features/settings/domain/entities/settings_entity.dart';
part 'settings_model.freezed.dart';
@freezed
class SettingsModel with _$SettingsModel {
  const SettingsModel._();
  const factory SettingsModel({
    required bool isDarkMode,
    required bool isNotificationsAllowed,
  }) = _SettingsModel;

  SettingsEntity toEntity() {
    return SettingsEntity(
      isDarkMode: isDarkMode,
      isNotificationsAllowed: isNotificationsAllowed,
    );
  }
  factory SettingsModel.fromEntity(SettingsEntity settings){
    return SettingsModel(
      isDarkMode: settings.isDarkMode,
      isNotificationsAllowed: settings.isNotificationsAllowed
    );
  }
}
