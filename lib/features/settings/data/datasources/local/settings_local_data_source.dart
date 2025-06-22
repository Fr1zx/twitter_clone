import 'package:frizter/features/settings/data/models/settings_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class SettingsLocalDataSource {
  Future<SettingsModel> getSavedSettings();
  Future<void> changeSettings(SettingsModel settingsModel);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences sharedPreferences;

  SettingsLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> changeSettings(SettingsModel settings) async {
    await sharedPreferences.setBool("isDarkMode", settings.isDarkMode);
    await sharedPreferences.setBool("notificationsAllowed", settings.isNotificationsAllowed);
  }

  @override
  Future<SettingsModel> getSavedSettings() async {
     final isDarkMode = sharedPreferences.getBool("isDarkMode") ?? false;
    final isAllowed = sharedPreferences.getBool("notificationsAllowed") ?? true;
    return SettingsModel(isDarkMode: isDarkMode, isNotificationsAllowed: isAllowed);
  }
}
