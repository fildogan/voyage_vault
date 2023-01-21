part of 'add_expense_cubit.dart';

@immutable
class AddExpenseState {
  const AddExpenseState({
    this.status = Status.initial,
    this.saved = false,
    this.errorMessage,
    this.categoryTitles = const [],
    this.voyageTitles = const [],
    this.voyageId = '',
  });

  final Status status;
  final bool saved;
  final String? errorMessage;
  final List<String> categoryTitles;
  final List<String> voyageTitles;
  final String voyageId;
}