import 'package:intl/intl.dart';

class VoyageModel {
  VoyageModel({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
  });
  final String id;
  final String title;
  final DateTime startDate;
  final DateTime endDate;

  int duration() => (endDate.difference(startDate).inDays);

  String startDateFormated() => DateFormat.yMd().format(startDate);
  // Formats start date to string

  String endDateFormated() => DateFormat.yMd().format(endDate);
  // Formats end date to string

}
