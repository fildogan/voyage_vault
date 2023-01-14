import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_cost_log/app/models/voyage_model.dart';
import 'package:travel_cost_log/app/repositories/voyages_repository.dart';

part 'voyages_state.dart';

class VoyagesCubit extends Cubit<VoyagesState> {
  VoyagesCubit(this._voyagesRepository) : super(VoyagesState());

  final VoyagesRepository _voyagesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription =
        _voyagesRepository.getVoyagesStream().listen((voyages) {
      emit(VoyagesState(voyages: voyages));
    })
          ..onError((error) {
            emit(VoyagesState(loadingErrorOccured: true));
          });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
