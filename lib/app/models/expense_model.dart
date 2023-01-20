import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_model.freezed.dart';

@freezed
class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    required String id,
    required String voyageId,
    required String name,
    required String category,
    required double price,
  }) = _ExpenseModel;
}
