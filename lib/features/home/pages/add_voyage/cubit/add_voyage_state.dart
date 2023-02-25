part of 'add_voyage_cubit.dart';

@freezed
class AddVoyageState with _$AddVoyageState {
  factory AddVoyageState({
    @Default(Status.initial) Status status,
    @Default(false) bool saved,
    String? errorMessage,
    String? successMessage,
    @Default([]) List<String> voyageTitles,
    @Default('') String voyageId,
    @Default('') String voyageTitle,
    DateTime? startDate,
    DateTime? endDate,
    @Default('') String location,
    @Default('') String description,
    @Default(0) double budget,
    @Default([]) List<VoyagerModel> voyagers,
  }) = _AddVoyageState;
  const AddVoyageState._();

  bool get isTitleValid => voyageTitle.isNotEmpty;
  bool get isLocationValid => location.isNotEmpty;
  bool get isBudgetValid => budget > 0;
  bool get isStartDateValid => startDate != null;
  bool get isEndDateValid => endDate != null;
  bool get isEndDateAfterStart => !endDate!.isBefore(startDate!);

  String get startDateFormatted =>
      startDate != null ? DateFormat.yMd().format(startDate!) : '';

  String get endDateFormatted =>
      endDate != null ? DateFormat.yMd().format(endDate!) : '';
}
