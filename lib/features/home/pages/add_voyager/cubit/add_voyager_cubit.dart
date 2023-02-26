import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/domain/repositories/voyager_repository.dart';

part 'add_voyager_state.dart';
part 'add_voyager_cubit.freezed.dart';

@injectable
class AddVoyagerCubit extends Cubit<AddVoyagerState> {
  AddVoyagerCubit(this._voyagersRepository) : super(AddVoyagerState());

  final VoyagersRepository _voyagersRepository;

  Future<void> add() async {
    emit(state.copyWith(formStatus: FormStatus.submitting));
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
}
