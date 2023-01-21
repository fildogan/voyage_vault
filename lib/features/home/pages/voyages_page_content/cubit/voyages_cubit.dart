import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:travel_cost_log/app/core/enums.dart';
import 'package:travel_cost_log/domain/models/voyage_model.dart';
import 'package:travel_cost_log/domain/repositories/voyages_repository.dart';

part 'voyages_state.dart';

@injectable
class VoyagesCubit extends Cubit<VoyagesState> {
  VoyagesCubit(this._voyagesRepository) : super(const VoyagesState());

  final VoyagesRepository _voyagesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const VoyagesState(
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
    required String documentID,
  }) async {
    emit(
      const VoyagesState(
        status: Status.loading,
      ),
    );
    try {
      await _voyagesRepository.remove(id: documentID);
      emit(
        const VoyagesState(
          status: Status.success,
        ),
      );
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