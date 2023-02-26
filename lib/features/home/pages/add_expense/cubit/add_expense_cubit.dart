import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/data/data_sources/local_data_sources/expense_category_list.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';
import 'package:voyage_vault/domain/repositories/expenses_repository.dart';
import 'package:voyage_vault/domain/repositories/voyager_repository.dart';
import 'package:voyage_vault/domain/repositories/voyages_repository.dart';

part 'add_expense_state.dart';
part 'add_expense_cubit.freezed.dart';

@injectable
class AddExpenseCubit extends Cubit<AddExpenseState> {
  AddExpenseCubit(this._voyagesRepository, this._expensesRepository,
      this._voyagersRepository)
      : super(AddExpenseState());

  final VoyagesRepository _voyagesRepository;

  final ExpensesRepository _expensesRepository;

  final VoyagersRepository _voyagersRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start(VoyageModel? voyageModel) async {
    emit(state.copyWith(
        voyage: voyageModel, voyagerIdList: voyageModel?.voyagers ?? []));
    await getVoyagesStream();
    await getVoyagerStream();
    emit(state.copyWith(status: Status.success));
  }

  Future<void> add() async {
    emit(state.copyWith(formStatus: FormStatus.submitting));
    try {
      if (state.voyage != null && state.category != null) {
        await _expensesRepository.add(
            state.name, state.voyage!.id, state.price, state.category!);
        emit(state.copyWith(
            formStatus: FormStatus.success,
            successMessage: '${state.name} added'));
      }
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
      ),
    );
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
          AddExpenseState(
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
          return voyager.copyWith(isSelected: true);
        }
        return voyager.copyWith(isSelected: false);
      }).toList();
      return updatedVoyagers
          .where((voyager) => voyager.isSelected == true)
          .toList();
    }).listen((voyagers) => emit(state.copyWith(voyagers: voyagers)))
          ..onError(
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
