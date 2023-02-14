part of 'add_expense_cubit.dart';

@freezed
class AddExpenseState with _$AddExpenseState {
  factory AddExpenseState({
    @Default(Status.initial) Status status,
    @Default(FormStatus.initial) FormStatus formStatus,
    String? errorMessage,
    String? successMessage,
    @Default(expenseCategoryList) List<String> categoryTitles,
    @Default([]) List<String> voyageTitles,
    @Default('') String voyageId,
    @Default('') String expenseId,
    @Default('') String name,
    String? category,
    @Default(0) double price,
    String? voyageTitle,
    DateTime? dateAdded,
  }) = _AddExpenseState;
  const AddExpenseState._();

  bool get isNameValid => name.isNotEmpty;
  bool get isPriceValid => price > 0;
  bool get isCategoryValid => category != null;
  bool get isVoyageValid => voyageTitle != null;
}
