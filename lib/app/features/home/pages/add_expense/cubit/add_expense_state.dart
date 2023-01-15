part of 'add_expense_cubit.dart';

@immutable
class AddExpenseState {
  const AddExpenseState({
    this.saved = false,
    this.errorMessage = '',
    this.categoryTitleList = const [],
  });

  final bool saved;
  final String errorMessage;
  final List<String> categoryTitleList;
}
