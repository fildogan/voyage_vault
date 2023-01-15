class ExpenseModel {
  ExpenseModel({
    required this.expenseID,
    required this.name,
    required this.voyageID,
    required this.expenseCategory,
  });

  final String expenseID;
  final String voyageID;
  final String name;
  final String expenseCategory;
}
