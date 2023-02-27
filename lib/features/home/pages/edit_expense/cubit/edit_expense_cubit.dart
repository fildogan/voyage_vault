import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/data/data_sources/local_data_sources/expense_category_list.dart';
import 'package:voyage_vault/domain/models/expense_model.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';
import 'package:voyage_vault/domain/repositories/expenses_repository.dart';
import 'package:voyage_vault/domain/repositories/voyager_repository.dart';
import 'package:voyage_vault/domain/repositories/voyages_repository.dart';

part 'edit_expense_state.dart';
part 'edit_expense_cubit.freezed.dart';

@injectable
class EditExpenseCubit extends Cubit<EditExpenseState> {
  EditExpenseCubit(this._voyagesRepository, this._expensesRepository,
      this._voyagersRepository)
      : super(EditExpenseState());

  final VoyagesRepository _voyagesRepository;

  final ExpensesRepository _expensesRepository;

  final VoyagersRepository _voyagersRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start({
    required ExpenseModel expenseModel,
    required VoyageModel voyageModel,
    VoyagerModel? voyagerModel,
  }) async {
    emit(state.copyWith(status: Status.loading));
    setValues(
        expenseModel: expenseModel,
        voyageModel: voyageModel,
        voyagerModel: voyagerModel);

    await getVoyagesStream();
    await getVoyagerStream();
    emit(state.copyWith(status: Status.success));
    await setVoyager2();
  }

  Future<void> getVoyagesStream() async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    _streamSubscription = _voyagesRepository.getVoyagesStream().listen(
          (voyages) => emit(
            state.copyWith(
              status: Status.success,
              voyages: voyages,
            ),
          ),
        )..onError(
        (error) => emit(
          EditExpenseState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        ),
      );
  }

  Future<void> getVoyagerStream() async {
    emit(state.copyWith(voyagerIdList: state.voyage?.voyagers ?? []));
    _streamSubscription =
        _voyagersRepository.getVoyagersStream().map((voyagers) {
      // Set isSelected to true for voyagers in selectedVoyagers list
      final updatedVoyagers = voyagers.map((voyager) {
        if (state.voyagerIdList.contains(voyager.id)) {
          return voyager;
        }
        return voyager.copyWith(isSelected: false);
      }).toList();
      return updatedVoyagers
          .where((voyager) => voyager.isSelected == null)
          .toList();
    }).listen((voyagers) => emit(state.copyWith(voyagers: voyagers)))
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
      required VoyageModel voyageModel,
      VoyagerModel? voyagerModel}) async {
    emit(
      state.copyWith(
        voyager: voyagerModel,
        initialVoyagerId: voyagerModel?.id ?? '',
        expenseId: expenseModel.id,
        name: expenseModel.name,
        price: expenseModel.price,
        dateAdded: expenseModel.dateAdded,
        category: expenseModel.category,
        voyageTitle: voyageModel.title,
        voyage: voyageModel,
        expense: expenseModel,
        voyagerIdList: voyageModel.voyagers ?? [],
      ),
    );
  }

  Future<void> setVoyager() async {
    for (var v in state.voyagers) {
      if (v.id == state.initialVoyagerId) {
        emit(state.copyWith(voyager: v));
        return;
      }
    }
    // If the function reaches this point, no Voyager was found with the given ID
    // emit(state.copyWith(voyager: null));
  }

  Future<void> setVoyager2() async {
    final List<VoyagerModel> voyagers = state.voyagers;
    final String? initialVoyagerId = state.expense?.voyagerId;

    emit(state.copyWith(
        voyager: (voyagers.isNotEmpty && initialVoyagerId != null)
            ? voyagers.firstWhere((voyager) => voyager.id == initialVoyagerId)
            : null));
  }

  Future<void> update() async {
    emit(state.copyWith(formStatus: FormStatus.submitting));
    try {
      if (state.voyage != null && state.voyager != null) {
        await _expensesRepository.update(
          id: state.expenseId,
          name: state.name,
          price: state.price,
          dateAdded: state.dateAdded!,
          category: state.category,
          voyageId: state.voyage!.id,
          voyagerId: state.voyager!.id,
        );
        emit(
          state.copyWith(
              formStatus: FormStatus.success,
              successMessage: '${state.name} updated'),
        );
      }
    } catch (error) {
      emit(
        EditExpenseState(
          status: Status.error,
          formStatus: FormStatus.error,
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

  Future<void> changeVoyage({
    required VoyageModel voyage,
  }) async {
    emit(state.copyWith(voyage: voyage, voyager: null));
    await getVoyagerStream();
  }

  Future<void> changeVoyager({
    required VoyagerModel voyager,
  }) async {
    emit(state.copyWith(voyager: voyager));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
