part of 'edit_expense_cubit.dart';

@freezed
class EditExpenseState with _$EditExpenseState {
  factory EditExpenseState({
    @Default(Status.initial) Status status,
    @Default(FormStatus.initial) FormStatus formStatus,
    String? errorMessage,
    String? successMessage,
    @Default(expenseCategoryList) List<String> categoryTitles,
    @Default([]) List<String> voyageTitles,
    @Default('') String voyageId,
    @Default('') String expenseId,
    @Default('') String name,
    @Default('') String category,
    @Default(0) double price,
    @Default('') String voyageTitle,
    DateTime? dateAdded,
  }) = _EditExpenseState;
  const EditExpenseState._();

  bool get isNameValid => name.isNotEmpty;
  bool get isPriceValid => price > 0;
  String get dateAddedFormated => DateFormat.yMd().format(dateAdded!);

  // EditExpenseState copyWith({
  //   String? name,
  //   String? category,
  //   double? price,
  //   DateTime? dateAdded,
  // }) {
  //   return EditExpenseState(
  //       name: name ?? this.name,
  //       category: category ?? this.category,
  //       price: price ?? this.price,
  //       dateAdded: dateAdded ?? this.dateAdded);
  // }
}
