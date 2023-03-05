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
    bool? isSelected,
  }) = _VoyagerModel;
  const VoyagerModel._();

  // Define a setter method for isSelected
  VoyagerModel setSelected(bool value) {
    return copyWith(isSelected: value);
  }

  // Define a getter method to get initials
  String get initials {
    final words = name.split(' ');
    if (words.isEmpty) {
      return '';
    }
    final firstInitial = words[0].substring(0, 1).toUpperCase();
    if (words.length == 1) {
      return firstInitial;
    }
    final secondInitial = words[1].substring(0, 1).toUpperCase();
    return '$firstInitial$secondInitial';
  }
}
