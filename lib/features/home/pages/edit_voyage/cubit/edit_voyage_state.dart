part of 'edit_voyage_cubit.dart';

@freezed
class EditVoyageState with _$EditVoyageState {
  factory EditVoyageState({
    @Default(Status.initial) Status status,
    @Default(false) bool saved,
    String? errorMessage,
    String? successMessage,
    @Default([]) List<String> voyageTitles,
    String? title,
    double? budget,
    DateTime? startDate,
    DateTime? endDate,
    String? location,
    String? description,
  }) = _EditVoyageState;
}
