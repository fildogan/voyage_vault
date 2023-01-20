import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:travel_cost_log/app/models/expense_model.dart';
import 'package:travel_cost_log/app/models/voyage_model.dart';
import 'package:travel_cost_log/app/repositories/expenses_repository.dart';

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
        emit(const VoyageDetailsState(loadingErrorOccured: true));
      });
  }

  // Future<void> getExpensesStream() async {
  //   _streamSubscription =
  //       _expensesRepository.getExpensesStream().listen((expenses) {
  //     emit(VoyageDetailsState(expenses: expenses));
  //   })
  //         ..onError((error) {
  //           emit(const VoyageDetailsState(loadingErrorOccured: true));
  //         });
  // }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
