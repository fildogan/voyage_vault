import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_cost_log/app/core/enums.dart';

part 'edit_expense_state.dart';
part 'edit_expense_cubit.freezed.dart';

@injectable
class EditExpenseCubit extends Cubit<EditExpenseState> {
  EditExpenseCubit() : super(EditExpenseState());
}
