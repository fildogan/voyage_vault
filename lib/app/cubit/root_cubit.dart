import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'root_state.dart';
part 'root_cubit.freezed.dart';

@injectable
class RootCubit extends Cubit<RootState> {
  RootCubit() : super(RootState());

  Future<void> setThemeDark() async {
    emit(state.copyWith(currentTheme: ThemeMode.dark));
  }

  Future<void> setThemeLight() async {
    emit(state.copyWith(currentTheme: ThemeMode.light));
  }

  Future<void> setThemeSystem() async {
    emit(state.copyWith(currentTheme: ThemeMode.system));
  }
}
