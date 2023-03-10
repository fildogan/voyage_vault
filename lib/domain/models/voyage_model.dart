import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'voyage_model.freezed.dart';

// RUN IN TERMINAL: flutter packages pub run build_runner build

@freezed
class VoyageModel with _$VoyageModel {
  const factory VoyageModel({
    required String id,
    required String title,
    required DateTime startDate,
    required DateTime endDate,
    required String location,
    required String description,
    required double budget,
    List<String>? voyagers,
  }) = _VoyageModel;
  const VoyageModel._();

  int duration() => endDate.difference(startDate).inDays + 1;

  String startDateFormated() => DateFormat.yMd().format(startDate);
  // Formats start date to string

  String endDateFormated() => DateFormat.yMd().format(endDate);
  // Formats end date to string
}
