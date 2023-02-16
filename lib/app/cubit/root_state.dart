part of 'root_cubit.dart';

@freezed
class RootState with _$RootState {
  factory RootState({
    @Default(Status.initial) Status status,
    @Default(SelectedLanguage.system) SelectedLanguage selectedLanguage,
    @Default(ThemeMode.system) ThemeMode currentTheme,
    Locale? locale,
    PackageInfo? packageInfo,
  }) = _RootState;
  const RootState._();
}
