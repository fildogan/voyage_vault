class ExpenseModel {
  ExpenseModel({
    required this.id,
    required this.voyageID,
    required this.name,
    required this.category,
    required this.price,
  });

  final String id;
  final String voyageID;
  final String name;
  final String category;
  final double price;
}
