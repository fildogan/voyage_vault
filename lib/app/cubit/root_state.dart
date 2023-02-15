part of 'root_cubit.dart';

@freezed
class RootState with _$RootState {
  factory RootState({
    @Default(Status.initial) Status status,
    @Default(ThemeMode.system) ThemeMode currentTheme,
    PackageInfo? packageInfo,
  }) = _RootState;
  const RootState._();
}
