import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_cost_log/app/core/enums.dart';
import 'package:travel_cost_log/domain/repositories/voyages_repository.dart';

part 'add_voyage_state.dart';
part 'add_voyage_cubit.freezed.dart';

@injectable
class AddVoyageCubit extends Cubit<AddVoyageState> {
  AddVoyageCubit(this._voyagesRepository) : super(AddVoyageState());

  final VoyagesRepository _voyagesRepository;

  StreamSubscription? _streamSubscription;

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
      emit(AddVoyageState(saved: true));
    } catch (error) {
      emit(
        AddVoyageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> addVoyageAndCheck({
    String? title,
    double? budget,
    DateTime? startDate,
    DateTime? endDate,
    String? location,
    String? description,
  }) async {
    if (title == null ||
        budget == null ||
        startDate == null ||
        endDate == null) {
      error('Please fill all fields');
    } else if (endDate.isBefore(startDate)) {
      error('Voyage start date should be before end date');
    } else if (state.voyageTitles
        .map((i) => i.toLowerCase())
        .contains(title.toLowerCase())) {
      error('Voyage title already exists');
    } else {
      add(
          title: title,
          budget: budget,
          startDate: startDate,
          endDate: endDate,
          location: location ?? '',
          description: description ?? '');
    }
  }

  Future<void> error(String error) async {
    emit(AddVoyageState(
      errorMessage: error,
      // voyageTitles: state.voyageTitles,
    ));
  }

  Future<void> getVoyageTitleStream() async {
    _streamSubscription = _voyagesRepository
        .getVoyagesStream()
        .map((voyages) => voyages.map((voyage) => voyage.title).toList())
        .listen(
          (voyageTitles) => emit(AddVoyageState(voyageTitles: voyageTitles)),
        )..onError(
        (error) => emit(
          AddVoyageState(
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
