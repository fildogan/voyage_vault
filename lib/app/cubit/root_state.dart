part of 'root_cubit.dart';

@freezed
class RootState with _$RootState {
  factory RootState({
    @Default(ThemeMode.system) ThemeMode currentTheme,
  }) = _RootState;
  const RootState._();
}
