import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/domain/models/expense_model.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';
import 'package:voyage_vault/domain/repositories/expenses_repository.dart';
import 'package:voyage_vault/domain/repositories/voyager_repository.dart';
import 'package:voyage_vault/domain/repositories/voyages_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'voyage_details_state.dart';
part 'voyage_details_cubit.freezed.dart';

@injectable
class VoyageDetailsCubit extends Cubit<VoyageDetailsState> {
  VoyageDetailsCubit(this._voyagesRepository, this._expensesRepository,
      this._voyagersRepository)
      : super(VoyageDetailsState());

  final VoyagesRepository _voyagesRepository;

  final ExpensesRepository _expensesRepository;

  final VoyagersRepository _voyagersRepository;

  StreamSubscription? _streamSubscription;

  StreamSubscription? _voyagesStreamSubscription;

  StreamSubscription? _voyagersStreamSubscription;

  StreamSubscription? _expensesStreamSubscription;

  // Future<void> refreshVoyage(String voyageId) async {

  //   emit(state.copyWith(status: Status.loading));

  //   final voyageStream = _voyagesRepository.getVoyageStreamById(voyageId);
  //   final expensesStream =
  //       _expensesRepository.getExpensesStreamByVoyageId(voyageId);
  //   final voyagersStream = _voyagersRepository
  //       .getVoyagersStreamById(state.voyageModel?.voyagers ?? []);

  //   _streamSubscription = Rx.combineLatest3(
  //     voyageStream,
  //     expensesStream,
  //     voyagersStream,
  //     (VoyageModel voyage, List<ExpenseModel> expenses,
  //         List<VoyagerModel> voyagers) {
  //       return state.copyWith(
  //         status: Status.success,
  //         voyageModel: voyage,
  //         expenses: expenses,
  //         voyagers: voyagers,
  //       );
  //     },
  //   ).listen((state) => emit(state), onError: (error) {
  //     emit(VoyageDetailsState(
  //       status: Status.error,
  //       errorMessage: error.toString(),
  //     ));
  //   });
  // }

  Future<void> refreshVoyage(String voyageId) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    // await getVoyageStreamByVoyageId(voyageId);
    await getVoyageWithId(voyageId);

    getExpensesStreamByVoyageId(voyageId);
    await getVoyagerModelStream();
  }

  Future<void> getVoyageWithId(String voyageId) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    try {
      final voyageModel = await _voyagesRepository.getVoyageById(voyageId);
      emit(state.copyWith(
        status: Status.success,
        voyageModel: voyageModel,
      ));
    } catch (error) {
      emit(
        VoyageDetailsState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> getExpensesStreamByVoyageId(String voyageId) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    _expensesStreamSubscription = _expensesRepository
        .getExpensesStreamByVoyageId(voyageId)
        .listen((expenses) {
      emit(state.copyWith(expenses: expenses, status: Status.success));
    })
      ..onError((error) {
        emit(
          VoyageDetailsState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> getVoyageStreamByVoyageId(String voyageId) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    _voyagesStreamSubscription =
        _voyagesRepository.getVoyageStreamById(voyageId).listen((voyage) {
      emit(state.copyWith(voyageModel: voyage, status: Status.success));
    })
          ..onError((error) {
            emit(
              VoyageDetailsState(
                status: Status.error,
                errorMessage: error.toString(),
              ),
            );
          });
  }

  Future<void> getVoyagerModelStream() async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    _voyagersStreamSubscription = _voyagersRepository
        .getVoyagersStreamById(state.voyageModel?.voyagers ?? [])
        .listen((voyagers) {
      emit(state.copyWith(
        voyagers: voyagers,
        status: Status.success,
      ));
    })
      ..onError((error) {
        emit(
          VoyageDetailsState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> remove({
    required String expenseId,
  }) async {
    try {
      await _expensesRepository.remove(id: expenseId);
    } catch (error) {
      emit(
        VoyageDetailsState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> showVoyagers() async {
    emit(state.copyWith(unhiddenVoyagers: !state.unhiddenVoyagers));
  }

  Future<void> showDetails() async {
    emit(state.copyWith(unhiddenDetails: !state.unhiddenDetails));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    _voyagersStreamSubscription?.cancel();
    _voyagesStreamSubscription?.cancel();
    _expensesStreamSubscription?.cancel();
    return super.close();
  }
}
