import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:travel_cost_log/app/models/voyage_model.dart';
import 'package:travel_cost_log/app/repositories/voyages_repository.dart';

part 'voyages_state.dart';

@injectable
class VoyagesCubit extends Cubit<VoyagesState> {
  VoyagesCubit(this._voyagesRepository) : super(const VoyagesState());

  final VoyagesRepository _voyagesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription =
        _voyagesRepository.getVoyagesStream().listen((voyages) {
      emit(VoyagesState(voyages: voyages));
    })
          ..onError((error) {
            emit(const VoyagesState(loadingErrorOccured: true));
          });
  }

  Future<void> remove({
    required String documentID,
  }) async {
    try {
      await _voyagesRepository.remove(id: documentID);
    } catch (error) {
      emit(const VoyagesState(removingErrorOccured: true));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
