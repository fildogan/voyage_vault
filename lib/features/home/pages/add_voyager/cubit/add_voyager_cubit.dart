import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';
import 'package:voyage_vault/domain/repositories/voyager_repository.dart';

part 'add_voyager_state.dart';
part 'add_voyager_cubit.freezed.dart';

@injectable
class AddVoyagerCubit extends Cubit<AddVoyagerState> {
  AddVoyagerCubit(
    this._voyagersRepository,
  ) : super(AddVoyagerState());

  final VoyagersRepository _voyagersRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(state.copyWith(status: Status.loading));

    // await Future.delayed(const Duration(seconds: 1));
    await getVoyagersStream();

    emit(state.copyWith(status: Status.success));
  }

  Future<void> add() async {
    emit(state.copyWith(
        formStatus: FormStatus.submitting, status: Status.loading));
    if (state.voyagerName == null || state.voyagerColor == null) {
      emit(state.copyWith(formStatus: FormStatus.initial));
    } else {
      _voyagersRepository.add(
        name: state.voyagerName ?? 'NoName',
        color: state.voyagerColor ?? Colors.green,
      );
      emit(state.copyWith(formStatus: FormStatus.success));
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
          AddVoyagerState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        ),
      );
  }

  Future<void> changeName({
    required String name,
  }) async {
    emit(state.copyWith(voyagerName: name));
  }

  Future<void> changeColor({
    required Color color,
  }) async {
    emit(state.copyWith(voyagerColor: color));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
