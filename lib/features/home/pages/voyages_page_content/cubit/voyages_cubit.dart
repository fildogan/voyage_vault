import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_cost_log/app/core/enums.dart';
import 'package:travel_cost_log/domain/models/voyage_model.dart';
import 'package:travel_cost_log/domain/repositories/expenses_repository.dart';
import 'package:travel_cost_log/domain/repositories/voyages_repository.dart';

part 'voyages_state.dart';
part 'voyages_cubit.freezed.dart';

@injectable
class VoyagesCubit extends Cubit<VoyagesState> {
  VoyagesCubit(this._voyagesRepository, this._expensesRepository)
      : super(VoyagesState());

  final VoyagesRepository _voyagesRepository;

  final ExpensesRepository _expensesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      VoyagesState(
        status: Status.loading,
      ),
    );
    _streamSubscription =
        _voyagesRepository.getVoyagesStream().listen((voyages) {
      emit(
        VoyagesState(
          status: Status.success,
          voyages: voyages,
        ),
      );
    })
          ..onError((error) {
            emit(
              VoyagesState(
                status: Status.error,
                errorMessage: error.toString(),
              ),
            );
          });
  }

  Future<void> remove({
    required String voyageId,
  }) async {
    try {
      await _voyagesRepository.remove(id: voyageId);
    } catch (error) {
      emit(
        VoyagesState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> removeExpensesByVoyageId({
    required String voyageId,
  }) async {
    try {
      await _expensesRepository.removeExpensesByVoyageId(voyageId: voyageId);
    } catch (error) {
      emit(
        VoyagesState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
