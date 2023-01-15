import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_expense_state.dart';

class AddExpenseCubit extends Cubit<AddExpenseState> {
  AddExpenseCubit() : super(AddExpenseInitial());
}
