import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_cost_log/app/core/enums.dart';
import 'package:travel_cost_log/domain/models/quote_model.dart';
import 'package:travel_cost_log/domain/repositories/quotes_repository.dart';

part 'add_page_content_state.dart';
part 'add_page_content_cubit.freezed.dart';

@injectable
class AddPageContentCubit extends Cubit<AddPageContentState> {
  AddPageContentCubit(this._quotesRepository) : super(AddPageContentState());

  final QuotesRepository _quotesRepository;

  Future<void> start() async {
    emit(
      AddPageContentState(
        status: Status.loading,
      ),
    );
    try {
      final quotes = await _quotesRepository.getQuoteModels();
      final intValue = Random().nextInt(quotes.length - 1);
      emit(
        AddPageContentState(
          status: Status.success,
          quotes: quotes,
          chosenQuote: quotes[intValue],
        ),
      );
    } catch (error) {
      emit(
        AddPageContentState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}