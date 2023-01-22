import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:travel_cost_log/app/core/enums.dart';
import 'package:travel_cost_log/domain/models/expense_model.dart';
import 'package:travel_cost_log/domain/models/voyage_model.dart';
import 'package:travel_cost_log/domain/repositories/expenses_repository.dart';

part 'voyage_details_state.dart';

@injectable
class VoyageDetailsCubit extends Cubit<VoyageDetailsState> {
  VoyageDetailsCubit(this._expensesRepository)
      : super(const VoyageDetailsState());

  // final VoyagesRepository _voyagesRepository;

  final ExpensesRepository _expensesRepository;

  StreamSubscription? _streamSubscription;

  // Future<void> getVoyageWithID(String voyageId) async {
  //   final voyageModel = await _voyagesRepository.getVoyageByID(voyageId);
  //   emit(VoyageDetailsState(voyageModel: voyageModel));
  // }

  Future<void> getExpensesStreamByVoyageId(String voyageId) async {
    _streamSubscription = _expensesRepository
        .getExpensesStreamByVoyageId(voyageId)
        .listen((expenses) {
      emit(VoyageDetailsState(expenses: expenses));
    })
      ..onError((error) {
        emit(
          VoyageDetailsState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> remove({
    required String expenseId,
  }) async {
    emit(
      const VoyageDetailsState(),
    );
    try {
      await _expensesRepository.remove(id: expenseId);
    } catch (error) {
      emit(
        VoyageDetailsState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  // Future<void> getTotalPriceByVoyageId(String voyageId) async {
  //   _streamSubscription = _expensesRepository
  //       .getTotalPriceByVoyageId(voyageId)
  //       .listen((totalPrice) {
  //     emit(VoyageDetailsState(totalPrice: totalPrice));
  //   })
  //     ..onError((error) {
  //       emit( VoyageDetailsState(status: Status.error,
  // errorMessage: error.toString(),));
  //     });
  // }

  // Future<void> getExpensesStream() async {
  //   _streamSubscription =
  //       _expensesRepository.getExpensesStream().listen((expenses) {
  //     emit(VoyageDetailsState(expenses: expenses));
  //   })
  //         ..onError((error) {
  //           emit( VoyageDetailsState(status: Status.error,
  // errorMessage: error.toString(),));
  //         });
  // }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
