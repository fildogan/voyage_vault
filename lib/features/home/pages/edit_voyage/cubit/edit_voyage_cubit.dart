import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/domain/repositories/voyages_repository.dart';

part 'edit_voyage_state.dart';
part 'edit_voyage_cubit.freezed.dart';

@injectable
class EditVoyageCubit extends Cubit<EditVoyageState> {
  EditVoyageCubit(this._voyagesRepository) : super(EditVoyageState());

  final VoyagesRepository _voyagesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start({required VoyageModel voyageModel}) async {
    setValues(
      voyageModel: voyageModel,
    );
    getVoyageTitleStream();
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
          (voyageTitles) => emit(state.copyWith(
            voyageTitles: voyageTitles,
          )),
        )..onError(
        (error) => emit(
          EditVoyageState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        ),
      );
  }

  Future<void> setValues({required VoyageModel voyageModel}) async {
    emit(
      state.copyWith(
        title: voyageModel.title,
        budget: voyageModel.budget,
        startDate: voyageModel.startDate,
        endDate: voyageModel.endDate,
        location: voyageModel.location,
        description: voyageModel.description,
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
    emit(state.copyWith(
      successMessage: null,
    ));
  }

  Future<void> updateVoyageAndCheck({
    required String voyageId,
    required String initialTitle,
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
    } else if ((state.voyageTitles
            .map((i) => i.toLowerCase())
            .contains(title.toLowerCase())) &&
        (title != initialTitle)) {
      error('Voyage title already exists');
    } else {
      update(
          voyageId: voyageId,
          title: title,
          budget: budget,
          startDate: startDate,
          endDate: endDate,
          location: location ?? '',
          description: description ?? '');
      final String capitalizedTitle =
          title[0].toUpperCase() + title.substring(1);
      success('$capitalizedTitle updated succesfully');
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
      state.copyWith(
        title: title,
        budget: budget,
        startDate: startDate,
        endDate: endDate,
        location: location,
        description: description,
      ),
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

  Future<void> changeTitleValue(
    String? title,
  ) async {
    emit(
      state.copyWith(
        title: title,
      ),
    );
  }

  Future<void> changeBudgetValue(
    double? budget,
  ) async {
    emit(
      state.copyWith(
        budget: budget,
      ),
    );
  }

  Future<void> changeLocationValue(
    String? location,
  ) async {
    emit(
      state.copyWith(
        location: location,
      ),
    );
  }

  Future<void> changeDescriptionValue(
    String? description,
  ) async {
    emit(
      state.copyWith(
        description: description,
      ),
    );
  }

  Future<void> changeStartDateValue(
    DateTime? startDate,
  ) async {
    emit(
      state.copyWith(
        startDate: startDate,
      ),
    );
  }

  Future<void> changeEndDateValue(
    DateTime? endDate,
  ) async {
    emit(
      state.copyWith(
        endDate: endDate,
      ),
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
