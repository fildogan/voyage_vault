import 'dart:async';

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

  final VoyagesRepository _voyagesRepository;

  // ignore: unused_field
  final ExpensesRepository _expensesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> getVoyageTitleStream() async {
    emit(
      EditExpenseState(
        status: Status.loading,
      ),
    );
    _streamSubscription = _voyagesRepository
        .getVoyagesStream()
        .map((voyages) => voyages.map((voyage) => voyage.title).toList())
        .listen(
          (voyageTitles) => emit(
            EditExpenseState(
              status: Status.success,
              voyageTitles: voyageTitles,
            ),
          ),
        )..onError(
        (error) => emit(
          EditExpenseState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        ),
      );
  }

  Future<void> update({
    required String expenseId,
    // String? name,
    required String voyageTitle,
    // double? price,
    required String category,
    required DateTime dateAdded,
  }) async {
    final voyageId = await _voyagesRepository.getVoyageIdByTitle(voyageTitle);

    // emit(
    //   EditExpenseState(
    //     name: name,
    //     price: price,
    //     dateAdded: dateAdded,
    //     category: category,
    //     voyageId: voyageId,
    //   ),
    // );
    try {
      await _expensesRepository.update(
        id: expenseId,
        name: state.name,
        price: state.price,
        dateAdded: dateAdded,
        category: category,
        voyageId: voyageId,
      );
      emit(
        EditExpenseState(
          saved: true,
        ),
      );
    } catch (error) {
      emit(
        EditExpenseState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> changeName({
    required String name,
  }) async {
    emit(
      EditExpenseState(
          name: name, voyageTitles: state.voyageTitles, price: state.price),
    );
  }

  Future<void> changePrice({
    required double price,
  }) async {
    emit(
      EditExpenseState(
          name: state.name, voyageTitles: state.voyageTitles, price: price),
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
