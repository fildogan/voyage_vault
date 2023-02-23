import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'voyager_model.freezed.dart';

// RUN IN TERMINAL: flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class VoyagerModel with _$VoyagerModel {
  const factory VoyagerModel({
    required String id,
    required String name,
    required Color color,
  }) = _VoyagerModel;
  const VoyagerModel._();
}
