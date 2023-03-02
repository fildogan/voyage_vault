part of 'add_voyage_cubit.dart';

@freezed
class AddVoyageState with _$AddVoyageState {
  factory AddVoyageState({
    @Default(Status.initial) Status status,
    @Default(FormStatus.initial) FormStatus formStatus,
    String? errorMessage,
    String? successMessage,
    @Default([]) List<String> voyageTitles,
    @Default('') String voyageId,
    @Default('') String title,
    @Default('') String location,
    @Default(0) double budget,
    DateTime? startDate,
    DateTime? endDate,
    @Default('') String description,
    @Default([]) List<VoyagerModel> voyagers,
  }) = _AddVoyageState;
  const AddVoyageState._();

  bool get isTitleValid => title.isNotEmpty;
  bool get isLocationValid => location.isNotEmpty;
  bool get isBudgetValid => budget > 0;
  bool get isStartDateValid => startDate != null;
  bool get isEndDateValid => endDate != null;
  bool get isEndDateAfterStart => !endDate!.isBefore(startDate!);
  bool get doesTitleExist =>
      (voyageTitles.map((i) => i.toLowerCase()).contains(title.toLowerCase()));

  String get startDateFormatted =>
      startDate != null ? DateFormat.yMd().format(startDate!) : '';

  String get endDateFormatted =>
      endDate != null ? DateFormat.yMd().format(endDate!) : '';

  String get budgetString => budget.toString();
}
