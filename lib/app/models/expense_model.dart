class ExpenseModel {
  ExpenseModel({
    required this.id,
    required this.voyageID,
    required this.name,
    required this.expenseCategory,
    required this.price,
  });

  final String id;
  final String voyageID;
  final String name;
  final String expenseCategory;
  final double price;
}
