part of 'edit_expense_cubit.dart';

@freezed
class EditExpenseState with _$EditExpenseState {
  factory EditExpenseState({
    @Default(Status.initial) Status status,
    @Default(false) bool saved,
    String? errorMessage,
    String? successMessage,
    @Default([]) List<String> categoryTitles,
    @Default([]) List<String> voyageTitles,
    @Default('') String voyageId,
    String? name,
    String? category,
    double? price,
    DateTime? dateAdded,
  }) = _EditExpenseState;
}
