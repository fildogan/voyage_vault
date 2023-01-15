import 'package:travel_cost_log/app/models/expense_category_model.dart';

class ExpenseModel {
  ExpenseModel(
    this.expenseID,
    this.title,
    this.travelID,
    this.expenseCategory,
  );

  final String expenseID;
  final String travelID;
  final String title;
  final ExpenseCategoryModel expenseCategory;
}
