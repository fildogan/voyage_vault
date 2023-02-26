import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/app/preferences_service.dart';
import 'package:voyage_vault/domain/models/settings_model.dart';
part 'root_state.dart';
part 'root_cubit.freezed.dart';

@injectable
class RootCubit extends Cubit<RootState> {
  RootCubit() : super(RootState());

  Future<void> start() async {
    emit(state.copyWith(status: Status.loading));

    getSettings();
    setPackageInfo();

    emit(state.copyWith(status: Status.success));
  }

  Future<void> setPackageInfo() async {
    final info = await PackageInfo.fromPlatform();

    emit(state.copyWith(packageInfo: info));
  }

  Future<void> getSettings() async {
    final SettingsModel settings = await PreferencesService().getSettings();
    final selectedTheme = settings.selectedTheme;
    final selectedLanguage = settings.selectedLanguage;
    emit(state.copyWith(
      selectedTheme: selectedTheme,
      selectedLanguage: selectedLanguage,
    ));
  }

  Future<void> setThemeDark() async {
    PreferencesService().saveTheme(SelectedTheme.dark);
    emit(state.copyWith(
      selectedTheme: SelectedTheme.dark,
    ));
  }

  Future<void> setThemeLight() async {
    PreferencesService().saveTheme(SelectedTheme.light);
    emit(state.copyWith(
      selectedTheme: SelectedTheme.light,
    ));
  }

  Future<void> setThemeSystem() async {
    PreferencesService().saveTheme(SelectedTheme.system);
    emit(state.copyWith(
      selectedTheme: SelectedTheme.system,
    ));
  }

  Future<void> setLanguageSystem() async {
    PreferencesService().saveLanguage(SelectedLanguage.system);
    emit(state.copyWith(
      selectedLanguage: SelectedLanguage.system,
    ));
  }

  Future<void> setLanguageEnglish() async {
    PreferencesService().saveLanguage(SelectedLanguage.english);
    emit(state.copyWith(
      selectedLanguage: SelectedLanguage.english,
    ));
  }

  Future<void> setLanguageSpanish() async {
    PreferencesService().saveLanguage(SelectedLanguage.spanish);
    emit(state.copyWith(
      selectedLanguage: SelectedLanguage.spanish,
    ));
  }

  Future<void> setLanguageFrench() async {
    PreferencesService().saveLanguage(SelectedLanguage.french);
    emit(state.copyWith(
      selectedLanguage: SelectedLanguage.french,
    ));
  }

  Future<void> setLanguageItalian() async {
    PreferencesService().saveLanguage(SelectedLanguage.italian);
    emit(state.copyWith(
      selectedLanguage: SelectedLanguage.italian,
    ));
  }

  Future<void> setLanguagePolish() async {
    PreferencesService().saveLanguage(SelectedLanguage.polish);
    emit(state.copyWith(
      selectedLanguage: SelectedLanguage.polish,
    ));
  }
}
