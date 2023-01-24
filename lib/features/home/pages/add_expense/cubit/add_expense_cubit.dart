import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_cost_log/app/core/enums.dart';
import 'package:travel_cost_log/domain/repositories/expenses_repository.dart';
import 'package:travel_cost_log/domain/repositories/voyages_repository.dart';

part 'add_expense_state.dart';
part 'add_expense_cubit.freezed.dart';

@injectable
class AddExpenseCubit extends Cubit<AddExpenseState> {
  AddExpenseCubit(
    this._expensesRepository,
    this._voyagesRepository,
  ) : super(AddExpenseState());

  final ExpensesRepository _expensesRepository;

  final VoyagesRepository _voyagesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> add(
    String name,
    String voyageId,
    double price,
    String category,
  ) async {
    emit(
      AddExpenseState(),
    );
    try {
      await _expensesRepository.add(name, voyageId, price, category);
      emit(
        AddExpenseState(
          saved: true,
        ),
      );
    } catch (error) {
      emit(
        AddExpenseState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> error(String errorMessage) async {
    emit(
      AddExpenseState(
        errorMessage: errorMessage,
        status: state.status,
        voyageTitles: state.voyageTitles,
      ),
    );
  }

  Future<void> getVoyageTitleStream() async {
    emit(
      AddExpenseState(
        status: Status.loading,
      ),
    );
    _streamSubscription = _voyagesRepository
        .getVoyagesStream()
        .map((voyages) => voyages.map((voyage) => voyage.title).toList())
        .listen(
          (voyageTitles) => emit(
            AddExpenseState(
              status: Status.success,
              voyageTitles: voyageTitles,
            ),
          ),
        )..onError(
        (error) => emit(
          AddExpenseState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        ),
      );
  }

  Future<void> addExpenseByVoyageTitle(
    String name,
    String voyageTitle,
    double price,
    String category,
  ) async {
    emit(
      AddExpenseState(),
    );
    final voyageId = await _voyagesRepository.getVoyageIdByTitle(voyageTitle);
    emit(
      AddExpenseState(
        voyageId: voyageId,
      ),
    );
    add(name, voyageId, price, category);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
