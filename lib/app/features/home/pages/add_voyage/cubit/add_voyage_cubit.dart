import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_cost_log/app/repositories/voyages_repository.dart';

part 'add_voyage_state.dart';

class AddVoyageCubit extends Cubit<AddVoyageState> {
  AddVoyageCubit(this._voyagesRepository) : super(const AddVoyageState());

  final VoyagesRepository _voyagesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> add(
    String title,
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      await _voyagesRepository.add(title, startDate, endDate);
      emit(const AddVoyageState(saved: true));
    } catch (error) {
      emit(AddVoyageState(errorMessage: error.toString()));
    }
  }

  Future<void> error(String error) async {
    emit(AddVoyageState(errorMessage: error));
  }

  Future<void> getVoyageTitleStream() async {
    _streamSubscription = _voyagesRepository
        .getVoyagesStream()
        .map((voyages) => voyages.map((voyage) => voyage.title).toList())
        .listen(
          (voyageTitles) => emit(AddVoyageState(voyageTitles: voyageTitles)),
        )..onError(
        (error) => emit(const AddVoyageState(loadingErrorOccured: true)),
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
