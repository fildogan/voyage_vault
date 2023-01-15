import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_cost_log/app/repositories/voyages_repository.dart';

part 'add_voyage_state.dart';

class AddVoyageCubit extends Cubit<AddVoyageState> {
  AddVoyageCubit(this._voyagesRepository) : super(const AddVoyageState());

  final VoyagesRepository _voyagesRepository;

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
}
