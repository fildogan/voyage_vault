part of 'add_page_content_cubit.dart';

@freezed
class AddPageContentState with _$AddPageContentState {
  factory AddPageContentState({
    @Default(Status.initial) Status status,
    String? errorMessage,
    @Default([]) List<QuoteModel> quotes,
    QuoteModel? chosenQuote,
  }) = _AddPageContentState;
}
