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


// class AddExpenseState {
//   const AddExpenseState({
//     this.status = Status.initial,
//     this.saved = false,
//     this.errorMessage,
//     this.categoryTitles = const [],
//     this.voyageTitles = const [],
//     this.voyageId = '',
//   });

//   final Status status;
//   final bool saved;
//   final String? errorMessage;
//   final List<String> categoryTitles;
//   final List<String> voyageTitles;
//   final String voyageId;
// }
