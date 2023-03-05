part of 'edit_expense_cubit.dart';

@freezed
class EditExpenseState with _$EditExpenseState {
  factory EditExpenseState({
    @Default(Status.initial) Status status,
    @Default(FormStatus.initial) FormStatus formStatus,
    String? errorMessage,
    String? successMessage,
    @Default(expenseCategoryList) List<String> categoryTitles,
    @Default([]) List<VoyageModel> voyages,
    //TODO: delete list voyagetitles
    @Default([]) List<String> voyageTitles,
    @Default('') String voyageId,
    @Default('') String expenseId,
    @Default('') String name,
    @Default([]) List<String> voyagerIdList,
    @Default('') String category,
    VoyagerModel? voyager,
    @Default(0) double price,
    VoyageModel? voyage,
    ExpenseModel? expense,
    @Default('') String voyageTitle,
    DateTime? dateAdded,
    @Default([]) List<VoyagerModel> voyagers,
    @Default('') String initialVoyagerId,
  }) = _EditExpenseState;
  const EditExpenseState._();

  bool get isNameValid => name.isNotEmpty;
  bool get isPriceValid => price > 0;
  bool get isCategoryValid => category.isNotEmpty;
  bool get isVoyageValid => voyage != null;

  String get dateAddedFormated =>
      dateAdded != null ? DateFormat.yMd().format(dateAdded!) : '';
}
