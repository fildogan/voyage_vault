import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';
import 'package:voyage_vault/domain/repositories/voyager_repository.dart';

part 'edit_voyager_state.dart';
part 'edit_voyager_cubit.freezed.dart';

@injectable
class EditVoyagerCubit extends Cubit<EditVoyagerState> {
  EditVoyagerCubit(
    this._voyagersRepository,
  ) : super(EditVoyagerState());

  final VoyagersRepository _voyagersRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start({required VoyagerModel voyagerModel}) async {
    emit(state.copyWith(status: Status.loading));

    emit(state.copyWith(voyager: voyagerModel, initialName: voyagerModel.name));

    await getVoyagersStream();

    emit(state.copyWith(status: Status.success));
  }

  Future<void> update() async {
    emit(state.copyWith(
      formStatus: FormStatus.submitting,
      status: Status.loading,
    ));

    try {
      await _voyagersRepository.update(
        id: state.voyager?.id ?? '',
        name: state.voyager?.name ?? 'NoName',
        color: state.voyager?.color ?? Colors.green,
      );
      emit(state.copyWith(
        formStatus: FormStatus.success,
      ));
    } catch (error) {
      emit(
        EditVoyagerState(
          status: Status.error,
          formStatus: FormStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> getVoyagersStream() async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    _streamSubscription = _voyagersRepository.getVoyagersStream().listen(
          (voyagers) => emit(
            state.copyWith(
              voyagers: voyagers,
            ),
          ),
        )..onError(
        (error) => emit(
          EditVoyagerState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        ),
      );
  }

  Future<void> changeName({
    required String name,
  }) async {
    emit(state.copyWith(voyager: state.voyager?.copyWith(name: name)));
  }

  Future<void> changeColor({
    required Color color,
  }) async {
    emit(state.copyWith(voyager: state.voyager?.copyWith(color: color)));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
