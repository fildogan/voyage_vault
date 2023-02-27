part of 'add_expense_cubit.dart';

@freezed
class AddExpenseState with _$AddExpenseState {
  factory AddExpenseState({
    @Default(Status.initial) Status status,
    @Default(FormStatus.initial) FormStatus formStatus,
    String? errorMessage,
    String? successMessage,
    @Default(expenseCategoryList) List<String> categoryTitles,
    @Default([]) List<VoyageModel> voyages,
    @Default('') String voyageId,
    @Default('') String expenseId,
    @Default('') String name,
    @Default([]) List<String> voyagerIdList,
    String? category,
    VoyagerModel? voyager,
    @Default(0) double price,
    VoyageModel? voyage,
    DateTime? dateAdded,
    @Default([]) List<VoyagerModel> voyagers,
  }) = _AddExpenseState;
  const AddExpenseState._();

  bool get isNameValid => name.isNotEmpty;
  bool get isPriceValid => price > 0;
  bool get isCategoryValid => category != null && (category ?? '').isNotEmpty;
  bool get isVoyageValid => voyage != null;
}
