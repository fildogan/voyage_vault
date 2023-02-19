import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/domain/models/quote_model.dart';
import 'package:voyage_vault/domain/repositories/quotes_repository.dart';

part 'add_page_content_state.dart';
part 'add_page_content_cubit.freezed.dart';

@injectable
class AddPageContentCubit extends Cubit<AddPageContentState> {
  AddPageContentCubit(this._quotesRepository) : super(AddPageContentState());

  final QuotesRepository _quotesRepository;

  Future<void> start() async {
    if (state.closed) {
      return;
    }

    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    try {
      print('quotes');
      final quotes = await _quotesRepository.getQuoteModels();
      final intValue = Random().nextInt(quotes.length - 1);
      // print(quotes[2].title);
      if (!state.closed) {
        print('quotes');

        emit(
          state.copyWith(
            status: Status.success,
            quotes: quotes,
            chosenQuote: quotes[intValue],
          ),
        );
      }
      print('quotes2');
    } catch (error) {
      if (!state.closed) {
        emit(
          AddPageContentState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<void> close() {
    emit(state.copyWith(closed: true));
    return super.close();
  }
}
