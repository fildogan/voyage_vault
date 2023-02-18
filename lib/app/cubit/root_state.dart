part of 'root_cubit.dart';

@freezed
class RootState with _$RootState {
  factory RootState({
    @Default(Status.initial) Status status,
    @Default(SelectedLanguage.system) SelectedLanguage selectedLanguage,
    @Default(SelectedTheme.system) SelectedTheme selectedTheme,
    PackageInfo? packageInfo,
  }) = _RootState;
  const RootState._();

  Locale? get locale {
    switch (selectedLanguage) {
      case SelectedLanguage.english:
        return const Locale('en');
      case SelectedLanguage.spanish:
        return const Locale('es');
      case SelectedLanguage.french:
        return const Locale('fr');
      case SelectedLanguage.italian:
        return const Locale('it');
      case SelectedLanguage.polish:
        return const Locale('pl');
      case SelectedLanguage.system:
        return null;
    }
  }

  ThemeMode get currentTheme {
    switch (selectedTheme) {
      case SelectedTheme.light:
        return ThemeMode.light;
      case SelectedTheme.dark:
        return ThemeMode.dark;
      case SelectedTheme.system:
        return ThemeMode.system;
    }
  }
}
