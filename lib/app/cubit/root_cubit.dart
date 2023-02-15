import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:voyage_vault/app/core/enums.dart';
part 'root_state.dart';
part 'root_cubit.freezed.dart';

@injectable
class RootCubit extends Cubit<RootState> {
  RootCubit() : super(RootState());

  Future<void> setPackageInfo() async {
    emit(state.copyWith(status: Status.loading));
    final info = await PackageInfo.fromPlatform();
    emit(state.copyWith(packageInfo: info, status: Status.success));
  }

  Future<void> setThemeDark() async {
    emit(state.copyWith(
      currentTheme: ThemeMode.dark,
    ));
  }

  Future<void> setThemeLight() async {
    emit(state.copyWith(
      currentTheme: ThemeMode.light,
    ));
  }

  Future<void> setThemeSystem() async {
    emit(state.copyWith(
      currentTheme: ThemeMode.system,
    ));
  }

  Future<void> setLanguageSystem() async {
    emit(state.copyWith(
      selectedLanguage: SelectedLanguage.system,
    ));
  }

  Future<void> setLanguageEnglish() async {
    emit(state.copyWith(
      selectedLanguage: SelectedLanguage.english,
    ));
  }

  Future<void> setLanguageSpanish() async {
    emit(state.copyWith(
      selectedLanguage: SelectedLanguage.spanish,
    ));
  }

  Future<void> setLanguageFrench() async {
    emit(state.copyWith(
      selectedLanguage: SelectedLanguage.french,
    ));
  }

  Future<void> setLanguageItalian() async {
    emit(state.copyWith(
      selectedLanguage: SelectedLanguage.italian,
    ));
  }

  Future<void> setLanguagePolish() async {
    emit(state.copyWith(
      selectedLanguage: SelectedLanguage.polish,
    ));
  }
}
