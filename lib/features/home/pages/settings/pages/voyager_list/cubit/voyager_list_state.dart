part of 'voyager_list_cubit.dart';

@freezed
class VoyagerListState with _$VoyagerListState {
  const factory VoyagerListState({
    @Default(Status.initial) Status status,
    String? errorMessage,
    @Default([]) List<VoyagerModel> voyagers,
  }) = _VoyagerListState;
}
