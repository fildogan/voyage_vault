part of 'add_expense_cubit.dart';

@immutable
class AddExpenseState {
  const AddExpenseState({
    this.saved = false,
    this.errorMessage = '',
    this.categoryTitles = const [],
    this.loadingErrorOccured = false,
    this.voyageTitles = const [],
  });

  final bool saved;
  final String errorMessage;
  final List<String> categoryTitles;
  final bool loadingErrorOccured;
  final List<String> voyageTitles;
}