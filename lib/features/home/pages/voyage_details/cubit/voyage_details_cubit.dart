import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/domain/models/expense_model.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';
import 'package:voyage_vault/domain/repositories/expenses_repository.dart';
import 'package:voyage_vault/domain/repositories/voyager_repository.dart';
import 'package:voyage_vault/domain/repositories/voyages_repository.dart';

part 'voyage_details_state.dart';
part 'voyage_details_cubit.freezed.dart';

@injectable
class VoyageDetailsCubit extends Cubit<VoyageDetailsState> {
  VoyageDetailsCubit(this._voyagesRepository, this._expensesRepository,
      this._voyagersRepository)
      : super(VoyageDetailsState());

  final VoyagesRepository _voyagesRepository;

  final ExpensesRepository _expensesRepository;

  final VoyagersRepository _voyagersRepository;

  StreamSubscription? _streamSubscription;

  Future<void> refreshVoyage(String voyageId) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    await getVoyageWithId(voyageId);
    getVoyagerModelStream();
    getExpensesStreamByVoyageId(voyageId);
  }

  Future<void> getVoyageWithId(String voyageId) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    try {
      final voyageModel = await _voyagesRepository.getVoyageById(voyageId);
      emit(state.copyWith(
        status: Status.success,
        voyageModel: voyageModel,
      ));
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
      state.copyWith(
        status: Status.loading,
      ),
    );
    _streamSubscription = _expensesRepository
        .getExpensesStreamByVoyageId(voyageId)
        .listen((expenses) {
      emit(state.copyWith(expenses: expenses, status: Status.success));
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

  Future<void> getVoyagerModelStream() async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    _streamSubscription = _voyagersRepository
        .getVoyagersStreamById(state.voyageModel?.voyagers ?? [])
        .listen((voyagers) {
      emit(state.copyWith(
        voyagers: voyagers,
        status: Status.success,
      ));
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
