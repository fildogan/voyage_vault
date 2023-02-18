import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voyage_vault/app/core/enums.dart';

part 'settings_model.freezed.dart';

@freezed
class SettingsModel with _$SettingsModel {
  const factory SettingsModel({
    required SelectedLanguage selectedLanguage,
    required SelectedTheme selectedTheme,
  }) = _SettingsModel;
}
