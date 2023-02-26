import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';
import 'package:voyage_vault/domain/repositories/voyager_repository.dart';
import 'package:voyage_vault/domain/repositories/voyages_repository.dart';

part 'add_voyage_state.dart';
part 'add_voyage_cubit.freezed.dart';

@injectable
class AddVoyageCubit extends Cubit<AddVoyageState> {
  AddVoyageCubit(this._voyagesRepository, this._voyagersRepository)
      : super(AddVoyageState());

  final VoyagesRepository _voyagesRepository;

  final VoyagersRepository _voyagersRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    getVoyageTitleStream();
    getVoyagerStream();
  }

  Future<void> add() async {
    List<String> selectedVoyagerIds = getSelectedVoyagerIds(state.voyagers);

    try {
      await _voyagesRepository.add(
        title: state.voyageTitle,
        budget: state.budget,
        startDate: state.startDate ?? DateTime(2022),
        endDate: state.endDate ?? DateTime(2022),
        location: state.location,
        description: state.description,
        voyagers: selectedVoyagerIds,
      );
      emit(state.copyWith(saved: true));
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
        title == '' ||
        budget == null ||
        budget == 0 ||
        budget.isNaN ||
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
      add();
      final String capitalizedTitle =
          title[0].toUpperCase() + title.substring(1);
      success('$capitalizedTitle added succesfully');
    }
  }

  Future<void> error(String error) async {
    emit(state.copyWith(
      errorMessage: error,
    ));
    emit(state.copyWith(
      errorMessage: null,
    ));
  }

  Future<void> success(String success) async {
    emit(state.copyWith(
      successMessage: success,
    ));
    emit(state.copyWith(
      successMessage: null,
    ));
  }

  Future<void> getVoyageTitleStream() async {
    _streamSubscription = _voyagesRepository
        .getVoyagesStream()
        .map((voyages) => voyages.map((voyage) => voyage.title).toList())
        .listen(
          (voyageTitles) => emit(state.copyWith(voyageTitles: voyageTitles)),
        )..onError(
        (error) => emit(
          AddVoyageState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        ),
      );
  }

  Future<void> getVoyagerStream() async {
    _streamSubscription = _voyagersRepository
        .getVoyagersStream()
        .map((voyagers) => voyagers.toList())
        .listen((voyagers) => emit(state.copyWith(voyagers: voyagers)))
      ..onError(
        (error) => emit(
          AddVoyageState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        ),
      );
  }

  List<String> getSelectedVoyagerIds(List<VoyagerModel> voyagers) {
    List<VoyagerModel> selectedVoyagers =
        voyagers.where((v) => v.isSelected == true).toList();
    List<String> selectedIds = selectedVoyagers.map((v) => v.id).toList();
    return selectedIds;
  }

  Future<void> changeTitle({
    required String title,
  }) async {
    emit(state.copyWith(voyageTitle: title));
  }

  Future<void> changeLocation({
    required String location,
  }) async {
    emit(state.copyWith(location: location));
  }

  Future<void> changeDescription({
    required String description,
  }) async {
    emit(state.copyWith(description: description));
  }

  Future<void> changeBudget({
    required double budget,
  }) async {
    emit(state.copyWith(budget: budget));
  }

  Future<void> changeStartDate({
    required DateTime startDate,
  }) async {
    emit(state.copyWith(startDate: startDate));
  }

  Future<void> changeEndDate({
    required DateTime endDate,
  }) async {
    emit(state.copyWith(endDate: endDate));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  Future<void> selectVoyager({
    required VoyagerModel voyagerModel,
  }) async {
    final newVoyagers = state.voyagers.map((v) {
      if (v.id == voyagerModel.id) {
        // Update the isSelected property for the target VoyagerModel
        return v.copyWith(isSelected: v.isSelected ?? false ? false : true);
      } else {
        return v;
      }
    }).toList();

    emit(state.copyWith(voyagers: newVoyagers));
  }
}
