import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_cost_log/app/repositories/expenses_repository.dart';
import 'package:travel_cost_log/app/repositories/voyages_repository.dart';

part 'add_expense_state.dart';

class AddExpenseCubit extends Cubit<AddExpenseState> {
  AddExpenseCubit(
    this._expensesRepository,
    this._voyagesRepository,
  ) : super(const AddExpenseState());

  final ExpensesRepository _expensesRepository;

  final VoyagesRepository _voyagesRepository;

  StreamSubscription? _streamSubscription;

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

  Future<void> error(String error) async {
    emit(AddExpenseState(errorMessage: error));
  }

  Future<void> getVoyageTitleStream() async {
    _streamSubscription = _voyagesRepository
        .getVoyagesStream()
        .map((voyages) => voyages.map((voyage) => voyage.title).toList())
        .listen(
          (voyageTitles) => emit(AddExpenseState(voyageTitles: voyageTitles)),
        )..onError(
        (error) => emit(const AddExpenseState(loadingErrorOccured: true)),
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
