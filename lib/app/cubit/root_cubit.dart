import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:travel_cost_log/app/core/enums.dart';
part 'root_state.dart';
part 'root_cubit.freezed.dart';

@injectable
class RootCubit extends Cubit<RootState> {
  RootCubit() : super(RootState());

  Future<void> setPackageInfo() async {
    emit(state.copyWith(status: Status.loading));
    final info = await PackageInfo.fromPlatform();
    emit(state.copyWith(packageInfo: info, status: Status.success));
  }

  Future<void> setThemeDark() async {
    emit(state.copyWith(
      currentTheme: ThemeMode.dark,
    ));
  }

  Future<void> setThemeLight() async {
    emit(state.copyWith(
      currentTheme: ThemeMode.light,
    ));
  }

  Future<void> setThemeSystem() async {
    emit(state.copyWith(
      currentTheme: ThemeMode.system,
    ));
  }
}
