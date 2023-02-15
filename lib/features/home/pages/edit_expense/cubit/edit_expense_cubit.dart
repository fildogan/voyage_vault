import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/data/data_sources/local_data_sources/expense_category_list.dart';
import 'package:voyage_vault/domain/models/expense_model.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/domain/repositories/expenses_repository.dart';
import 'package:voyage_vault/domain/repositories/voyages_repository.dart';

part 'edit_expense_state.dart';
part 'edit_expense_cubit.freezed.dart';

@injectable
class EditExpenseCubit extends Cubit<EditExpenseState> {
  EditExpenseCubit(this._voyagesRepository, this._expensesRepository)
      : super(EditExpenseState());

  final VoyagesRepository _voyagesRepository;

  final ExpensesRepository _expensesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start({
    required ExpenseModel expenseModel,
    required VoyageModel voyageModel,
  }) async {
    setValues(expenseModel: expenseModel, voyageModel: voyageModel);
    await getVoyageTitleStream();
    emit(state.copyWith(status: Status.success));
  }

  Future<void> getVoyageTitleStream() async {
    emit(state.copyWith(status: Status.loading));
    _streamSubscription = _voyagesRepository
        .getVoyagesStream()
        .map((voyages) => voyages.map((voyage) => voyage.title).toList())
        .listen((voyageTitles) => emit(
            state.copyWith(status: Status.success, voyageTitles: voyageTitles)))
      ..onError(
        (error) => emit(
          EditExpenseState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        ),
      );
  }

  Future<void> setValues(
      {required ExpenseModel expenseModel,
      required VoyageModel voyageModel}) async {
    emit(
      state.copyWith(
          expenseId: expenseModel.id,
          name: expenseModel.name,
          price: expenseModel.price,
          dateAdded: expenseModel.dateAdded,
          category: expenseModel.category,
          voyageTitle: voyageModel.title),
    );
  }

  Future<void> update() async {
    final voyageId =
        await _voyagesRepository.getVoyageIdByTitle(state.voyageTitle);

    emit(state.copyWith(formStatus: FormStatus.submitting));
    try {
      await _expensesRepository.update(
        id: state.expenseId,
        name: state.name,
        price: state.price,
        dateAdded: state.dateAdded!,
        category: state.category,
        voyageId: voyageId,
      );
      emit(
        state.copyWith(
            formStatus: FormStatus.success,
            successMessage: '${state.name} updated'),
      );
    } catch (error) {
      emit(
        EditExpenseState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
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

  Future<void> changeDateAdded({
    required DateTime dateAdded,
  }) async {
    emit(state.copyWith(dateAdded: dateAdded));
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
