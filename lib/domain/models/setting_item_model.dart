import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_item_model.freezed.dart';

// RUN IN TERMINAL: flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class SettingItemModel with _$SettingItemModel {
  const factory SettingItemModel({
    required String title,
    required Widget trailing,
    void Function()? onTap,
  }) = _SettingItemModel;
  const SettingItemModel._();
}
