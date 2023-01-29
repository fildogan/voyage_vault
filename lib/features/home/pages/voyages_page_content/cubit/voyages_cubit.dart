import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_cost_log/app/core/enums.dart';
import 'package:travel_cost_log/domain/models/voyage_model.dart';
import 'package:travel_cost_log/domain/repositories/expenses_repository.dart';
import 'package:travel_cost_log/domain/repositories/voyages_repository.dart';

part 'voyages_state.dart';
part 'voyages_cubit.freezed.dart';

@injectable
class VoyagesCubit extends Cubit<VoyagesState> {
  VoyagesCubit() : super(VoyagesState());

  final VoyagesRepository _voyagesRepository =
      GetIt.instance<VoyagesRepository>();

  final ExpensesRepository _expensesRepository =
      GetIt.instance<ExpensesRepository>();

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
    emit(
      VoyagesState(),
    );
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
    emit(
      VoyagesState(),
    );
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
