part of 'edit_expense_cubit.dart';

@freezed
class EditExpenseState with _$EditExpenseState {
  factory EditExpenseState({
    @Default(Status.initial) Status status,
    @Default(FormStatus.initial) FormStatus formStatus,
    @Default(false) bool saved,
    String? errorMessage,
    String? successMessage,
    @Default([]) List<String> categoryTitles,
    @Default([]) List<String> voyageTitles,
    @Default('') String voyageId,
    @Default('') String name,
    String? category,
    @Default(0) double price,
    DateTime? dateAdded,
  }) = _EditExpenseState;
  const EditExpenseState._();

  bool get isNameValid => name.isNotEmpty;
  bool get isPriceValid => price > 0;

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
