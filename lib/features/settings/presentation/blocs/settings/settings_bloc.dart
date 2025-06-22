import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frizter/core/usecases/use_case.dart';
import 'package:frizter/features/settings/domain/entities/settings_entity.dart';
import 'package:frizter/features/settings/domain/usecases/change_settings_use_case.dart';
import 'package:frizter/features/settings/domain/usecases/get_saved_settings_use_case.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetSavedSettingsUseCase getSavedSettingsUseCase;
  final ChangeSettingsUseCase changeSettingsUseCase;
  SettingsBloc({
    required this.getSavedSettingsUseCase,
    required this.changeSettingsUseCase,
  }) : super(_Initial()) {
    on<_GetSavedSettings>(_getSavedSettings);
    on<_ChangeTheme>(_changeTheme);
    on<_ChangeNotifications>(_changeNotifications);
  }

  _getSavedSettings(
    _GetSavedSettings event,
    Emitter<SettingsState> emit,
  ) async {
    final settingsOrFailure = await getSavedSettingsUseCase.call(NoParams());
    settingsOrFailure.fold(
      (error) => emit(SettingsState.failure(error.message)),
      (settings) => emit(SettingsState.loaded(settings: settings)),
    );
  }

  _changeTheme(_ChangeTheme event, Emitter<SettingsState> emit) async {
    if (state is _Loaded) {
      final currentState = state as _Loaded;
      final newSettings = currentState.settings.copyWith(
        isDarkMode: !currentState.settings.isDarkMode,
      );
      final changeSettingsOrFailure = await changeSettingsUseCase.call(
        newSettings,
      );
      changeSettingsOrFailure.fold(
        (error) => emit(SettingsState.failure(error.message)),
        (_) => emit(SettingsState.loaded(settings: newSettings)),
      );
    }
  }

  _changeNotifications(
    _ChangeNotifications event,
    Emitter<SettingsState> emit,
  ) async {
    if (state is _Loaded) {
      final currentState = state as _Loaded;
      final newSettings = currentState.settings.copyWith(
        isNotificationsAllowed: !currentState.settings.isNotificationsAllowed,
      );
      final changeSettingsOrFailure = await changeSettingsUseCase.call(
        newSettings,
      );
      changeSettingsOrFailure.fold(
        (error) => emit(SettingsState.failure(error.message)),
        (_) => emit(SettingsState.loaded(settings: newSettings)),
      );
    }
  }
}
