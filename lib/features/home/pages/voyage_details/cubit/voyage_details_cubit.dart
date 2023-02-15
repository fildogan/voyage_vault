import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/domain/models/expense_model.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/domain/repositories/expenses_repository.dart';
import 'package:voyage_vault/domain/repositories/voyages_repository.dart';

part 'voyage_details_state.dart';
part 'voyage_details_cubit.freezed.dart';

@injectable
class VoyageDetailsCubit extends Cubit<VoyageDetailsState> {
  VoyageDetailsCubit(this._voyagesRepository, this._expensesRepository)
      : super(VoyageDetailsState());

  final VoyagesRepository _voyagesRepository;

  final ExpensesRepository _expensesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> refreshVoyage(String voyageId) async {
    getVoyageWithId(voyageId);
    getExpensesStreamByVoyageId(voyageId);
  }

  Future<void> getVoyageWithId(String voyageId) async {
    emit(
      VoyageDetailsState(
        status: Status.loading,
        expenses: state.expenses,
        voyageModel: state.voyageModel,
      ),
    );
    try {
      final voyageModel = await _voyagesRepository.getVoyageById(voyageId);
      emit(VoyageDetailsState(
          status: Status.success,
          voyageModel: voyageModel,
          expenses: state.expenses));
    } catch (error) {
      emit(
        VoyageDetailsState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> getExpensesStreamByVoyageId(String voyageId) async {
    emit(
      VoyageDetailsState(
        status: Status.loading,
        expenses: state.expenses,
        voyageModel: state.voyageModel,
      ),
    );
    _streamSubscription = _expensesRepository
        .getExpensesStreamByVoyageId(voyageId)
        .listen((expenses) {
      emit(VoyageDetailsState(
          expenses: expenses,
          voyageModel: state.voyageModel,
          status: Status.success));
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
