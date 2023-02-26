import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';
import 'package:voyage_vault/domain/repositories/voyager_repository.dart';
import 'package:voyage_vault/domain/repositories/voyages_repository.dart';

part 'edit_voyage_state.dart';
part 'edit_voyage_cubit.freezed.dart';

@injectable
class EditVoyageCubit extends Cubit<EditVoyageState> {
  EditVoyageCubit(this._voyagesRepository, this._voyagersRepository)
      : super(EditVoyageState());

  final VoyagesRepository _voyagesRepository;

  final VoyagersRepository _voyagersRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start({required VoyageModel voyageModel}) async {
    setValues(
      voyageModel: voyageModel,
    );
    getVoyageTitleStream();
    getVoyagerStream();
  }

  Future<void> setValues({required VoyageModel voyageModel}) async {
    emit(
      state.copyWith(
        voyageId: voyageModel.id,
        title: voyageModel.title,
        budget: voyageModel.budget,
        startDate: voyageModel.startDate,
        endDate: voyageModel.endDate,
        location: voyageModel.location,
        description: voyageModel.description,
        selectedVoyagers: voyageModel.voyagers ?? [],
        initialTitle: voyageModel.title,
      ),
    );
  }

  Future<void> getVoyageTitleStream() async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    _streamSubscription = _voyagesRepository
        .getVoyagesStream()
        .map((voyages) => voyages.map((voyage) => voyage.title).toList())
        .listen(
          (voyageTitles) => emit(
            state.copyWith(
              voyageTitles: voyageTitles,
            ),
          ),
        )..onError(
        (error) => emit(
          EditVoyageState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        ),
      );
  }

  Future<void> getVoyagerStream() async {
    _streamSubscription =
        _voyagersRepository.getVoyagersStream().map((voyagers) {
      // Set isSelected to true for voyagers in selectedVoyagers list
      final updatedVoyagers = voyagers.map((voyager) {
        if (state.selectedVoyagers.contains(voyager.id)) {
          return voyager.copyWith(isSelected: true);
        }
        return voyager;
      }).toList();
      return updatedVoyagers;
    }).listen((voyagers) => emit(state.copyWith(voyagers: voyagers)))
          ..onError(
            (error) => emit(
              EditVoyageState(
                status: Status.error,
                errorMessage: error.toString(),
              ),
            ),
          );
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
    emit(
      state.copyWith(
        successMessage: null,
      ),
    );
  }

  Future<void> update() async {
    List<String> selectedVoyagerIds = getSelectedVoyagerIds(state.voyagers);

    try {
      await _voyagesRepository.update(
        id: state.voyageId,
        title: state.title,
        budget: state.budget,
        startDate: state.startDate ?? DateTime(2022),
        endDate: state.endDate ?? DateTime(2022),
        location: state.location,
        description: state.description,
        voyagers: selectedVoyagerIds,
      );
      emit(
        state.copyWith(
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

  List<String> getSelectedVoyagerIds(List<VoyagerModel> voyagers) {
    List<VoyagerModel> selectedVoyagers =
        voyagers.where((v) => v.isSelected == true).toList();
    List<String> selectedIds = selectedVoyagers.map((v) => v.id).toList();
    return selectedIds;
  }

  Future<void> changeTitle({
    required String title,
  }) async {
    emit(state.copyWith(title: title));
  }

  Future<void> changeLocation({
    required String location,
  }) async {
    emit(state.copyWith(location: location));
  }

  Future<void> changeBudget({
    required double budget,
  }) async {
    emit(state.copyWith(budget: budget));
  }

  Future<void> changeDescription({
    required String description,
  }) async {
    emit(state.copyWith(description: description));
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

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
