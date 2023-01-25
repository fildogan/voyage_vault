import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_cost_log/app/core/enums.dart';
import 'package:travel_cost_log/domain/repositories/voyages_repository.dart';

part 'edit_voyage_state.dart';
part 'edit_voyage_cubit.freezed.dart';

@injectable
class EditVoyageCubit extends Cubit<EditVoyageState> {
  EditVoyageCubit(this._voyagesRepository) : super(EditVoyageState());

  final VoyagesRepository _voyagesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> error(String error) async {
    emit(EditVoyageState(
      errorMessage: error,
    ));
  }

  Future<void> success(String success) async {
    emit(EditVoyageState(
      successMessage: success,
    ));
  }

  Future<void> add({
    required String title,
    required double budget,
    required DateTime startDate,
    required DateTime endDate,
    required String location,
    required String description,
  }) async {
    try {
      await _voyagesRepository.add(
        title: title,
        budget: budget,
        startDate: startDate,
        endDate: endDate,
        location: location,
        description: description,
      );
      emit(EditVoyageState(saved: true));
    } catch (error) {
      emit(
        EditVoyageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> remove({
    required String voyageId,
  }) async {
    emit(
      EditVoyageState(),
    );
    try {
      await _voyagesRepository.remove(id: voyageId);
    } catch (error) {
      emit(
        EditVoyageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> update({
    required String voyageId,
    required String title,
    required double budget,
    required DateTime startDate,
    required DateTime endDate,
    required String location,
    required String description,
  }) async {
    emit(
      EditVoyageState(),
    );
    try {
      await _voyagesRepository.update(
          id: voyageId,
          title: title,
          budget: budget,
          startDate: startDate,
          endDate: endDate,
          location: location,
          description: description);
      emit(
        EditVoyageState(
          saved: true,
        ),
      );
    } catch (error) {
      emit(
        EditVoyageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> getVoyageTitleStream() async {
    _streamSubscription = _voyagesRepository
        .getVoyagesStream()
        .map((voyages) => voyages.map((voyage) => voyage.title).toList())
        .listen(
          (voyageTitles) => emit(EditVoyageState(voyageTitles: voyageTitles)),
        )..onError(
        (error) => emit(
          EditVoyageState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        ),
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
