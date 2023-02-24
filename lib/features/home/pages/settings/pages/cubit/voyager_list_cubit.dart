import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';
import 'package:voyage_vault/domain/repositories/voyager_repository.dart';

part 'voyager_list_state.dart';
part 'voyager_list_cubit.freezed.dart';

@injectable
class VoyagerListCubit extends Cubit<VoyagerListState> {
  VoyagerListCubit(this._voyagersRepository) : super(VoyagerListState());

  final VoyagersRepository _voyagersRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    _streamSubscription =
        _voyagersRepository.getVoyagersStream().listen((voyagers) {
      emit(
        state.copyWith(
          status: Status.success,
          voyagers: voyagers,
        ),
      );
    })
          ..onError((error) {
            emit(
              VoyagerListState(
                status: Status.error,
                errorMessage: error.toString(),
              ),
            );
          });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
