import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'expense_model.freezed.dart';

// RUN IN TERMINAL: flutter packages pub run build_runner build

@freezed
class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    required String id,
    required String voyageId,
    required String name,
    required String category,
    required double price,
    required DateTime dateAdded,
  }) = _ExpenseModel;
  const ExpenseModel._();

  String dateAddedFormated() => DateFormat.yMMMd().format(dateAdded);
}
