part of 'add_voyager_cubit.dart';

@freezed
class AddVoyagerState with _$AddVoyagerState {
  factory AddVoyagerState({
    @Default(Status.initial) Status status,
    @Default(FormStatus.initial) FormStatus formStatus,
    String? errorMessage,
    String? successMessage,
    String? voyagerName,
    Color? voyagerColor,
  }) = _AddVoyagerState;
}
