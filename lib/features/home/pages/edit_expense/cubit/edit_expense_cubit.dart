import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_cost_log/app/core/enums.dart';
import 'package:travel_cost_log/domain/repositories/expenses_repository.dart';
import 'package:travel_cost_log/domain/repositories/voyages_repository.dart';

part 'edit_expense_state.dart';
part 'edit_expense_cubit.freezed.dart';

@injectable
class EditExpenseCubit extends Cubit<EditExpenseState> {
  EditExpenseCubit(this._voyagesRepository, this._expensesRepository)
      : super(EditExpenseState());

  // ignore: unused_field
  final VoyagesRepository _voyagesRepository;

  // ignore: unused_field
  final ExpensesRepository _expensesRepository;
}
