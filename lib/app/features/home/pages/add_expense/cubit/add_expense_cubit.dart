import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_cost_log/app/repositories/expense_categories_repository.dart';
import 'package:travel_cost_log/app/repositories/expenses_repository.dart';

part 'add_expense_state.dart';

class AddExpenseCubit extends Cubit<AddExpenseState> {
  AddExpenseCubit(this._expensesRepository, this._expenseCategoriesRepository)
      : super(const AddExpenseState());

  final ExpensesRepository _expensesRepository;

  final ExpenseCategoriesRepository _expenseCategoriesRepository;

  Future<void> add(
    String name,
    String voyageID,
    double price,
    String category,
  ) async {
    try {
      await _expensesRepository.add(name, voyageID, price, category);
      emit(const AddExpenseState(saved: true));
    } catch (error) {
      emit(AddExpenseState(errorMessage: error.toString()));
    }
  }

  Future<void> getCategoryList() async {
    final List<String> categoryTitleList =
        _expenseCategoriesRepository.getCategoryTitleList();
    emit(AddExpenseState(categoryTitleList: categoryTitleList));
  }
}
