// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'quote_model.freezed.dart';

// part 'quote_model.g.dart';

// RUN IN TERMINAL: flutter packages pub run build_runner build
// OR: flutter pub run build_runner build --delete-conflicting-outputs

// @freezed
// class QuoteModel with _$QuoteModel {
//   factory QuoteModel(
//     int id,
//     String title,
//     String author,
//   ) = _QuoteModel;
//   factory QuoteModel.fromJson(Map<String, dynamic> json) =>
//       _$QuoteModelFromJson(json);
// }

class QuoteModel {
  const QuoteModel({
    required this.id,
    required this.title,
    required this.author,
  });

  final int id;
  final String title;
  final String author;

  QuoteModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        author = json['author'];
}
