part of 'add_expense_cubit.dart';

@freezed
class AddExpenseState with _$AddExpenseState {
  factory AddExpenseState({
    @Default(Status.initial) Status status,
    @Default(false) bool saved,
    String? errorMessage,
    @Default([]) List<String> categoryTitles,
    @Default([]) List<String> voyageTitles,
    @Default('') String voyageId,
  }) = _AddExpenseState;
}
