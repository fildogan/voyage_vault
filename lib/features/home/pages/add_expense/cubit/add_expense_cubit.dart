import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_cost_log/app/core/enums.dart';
import 'package:travel_cost_log/data/data_sources/local_data_sources/expense_category_list.dart';
import 'package:travel_cost_log/domain/models/voyage_model.dart';
import 'package:travel_cost_log/domain/repositories/expenses_repository.dart';
import 'package:travel_cost_log/domain/repositories/voyages_repository.dart';

part 'add_expense_state.dart';
part 'add_expense_cubit.freezed.dart';

@injectable
class AddExpenseCubit extends Cubit<AddExpenseState> {
  AddExpenseCubit(this._voyagesRepository, this._expensesRepository)
      : super(AddExpenseState());

  final VoyagesRepository _voyagesRepository;

  final ExpensesRepository _expensesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start(VoyageModel? voyageModel) async {
    emit(state.copyWith(voyageTitle: voyageModel?.title));
    await getVoyageTitleStream();
    emit(state.copyWith(status: Status.success));
  }

  Future<void> add() async {
    final voyageId =
        await _voyagesRepository.getVoyageIdByTitle(state.voyageTitle!);
    emit(state.copyWith(formStatus: FormStatus.submitting));
    try {
      await _expensesRepository.add(
          state.name, voyageId, state.price, state.category!);
      emit(state.copyWith(
          formStatus: FormStatus.success,
          successMessage: '${state.name} added'));
    } catch (error) {
      emit(
        AddExpenseState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> error(String errorMessage) async {
    emit(
      state.copyWith(
        errorMessage: errorMessage,
        status: state.status,
        voyageTitles: state.voyageTitles,
      ),
    );
  }

  Future<void> getVoyageTitleStream() async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    _streamSubscription = _voyagesRepository
        .getVoyagesStream()
        .map((voyages) => voyages.map((voyage) => voyage.title).toList())
        .listen(
          (voyageTitles) => emit(
            state.copyWith(
              status: Status.success,
              voyageTitles: voyageTitles,
            ),
          ),
        )..onError(
        (error) => emit(
          AddExpenseState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        ),
      );
  }

  Future<void> changeName({
    required String name,
  }) async {
    emit(state.copyWith(name: name));
  }

  Future<void> changePrice({
    required double price,
  }) async {
    emit(state.copyWith(price: price));
  }

  Future<void> changeCategory({
    required String category,
  }) async {
    emit(state.copyWith(category: category));
  }

  Future<void> changeVoyageTitle({
    required String voyageTitle,
  }) async {
    emit(state.copyWith(voyageTitle: voyageTitle));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
