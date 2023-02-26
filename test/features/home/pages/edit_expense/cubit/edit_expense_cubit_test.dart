import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/domain/models/expense_model.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/domain/repositories/voyages_repository.dart';
import 'package:voyage_vault/domain/repositories/expenses_repository.dart';
import 'package:voyage_vault/features/home/pages/edit_expense/cubit/edit_expense_cubit.dart';

@GenerateNiceMocks([MockSpec<VoyagesRepository>()])
@GenerateNiceMocks([MockSpec<ExpensesRepository>()])
import 'edit_expense_cubit_test.mocks.dart';

void main() {
  late EditExpenseCubit sut;
  late MockVoyagesRepository voyagesRepository;
  late MockExpensesRepository expensesRepository;
  VoyageModel voyageModel1 = VoyageModel(
      id: 'id',
      title: 'title',
      startDate: DateTime(2020),
      endDate: DateTime(2020),
      location: 'location',
      description: 'description',
      budget: 1.0);
  ExpenseModel expenseModel1 = ExpenseModel(
    id: 'id',
    voyageId: 'voyageId',
    name: 'name',
    category: 'category',
    price: 50,
    dateAdded: DateTime(2020),
  );
  EditExpenseState currentState = EditExpenseState(
    status: Status.success,
    formStatus: FormStatus.initial,
    errorMessage: null,
    successMessage: null,
    categoryTitles: ['expense1', 'expense2'],
    voyageTitles: ['voyageTitle1', 'voyageTitle2'],
    voyageId: expenseModel1.voyageId,
    expenseId: expenseModel1.id,
    name: expenseModel1.name,
    category: expenseModel1.category,
    price: expenseModel1.price,
    voyageTitle: voyageModel1.title,
    dateAdded: expenseModel1.dateAdded,
  );

  setUp(
    () {
      expensesRepository = MockExpensesRepository();
      voyagesRepository = MockVoyagesRepository();
      sut = EditExpenseCubit(voyagesRepository, expensesRepository);
    },
  );

  test(
    'should initialize with default state',
    () {
      expect(sut.state, equals(EditExpenseState()));
    },
  );

  group(
    'start',
    () {
      blocTest<EditExpenseCubit, EditExpenseState>(
        'should call getVoyageTitleStream from voyagesRepository and emit setValues when start is called',
        build: () => sut,
        act: (cubit) async =>
            cubit.start(voyageModel: voyageModel1, expenseModel: expenseModel1),
        wait: const Duration(milliseconds: 300),
        verify: (_) async {
          // Verify if getVoyagesStream is called
          verify(voyagesRepository.getVoyagesStream()).called(1);
        },
        expect: () => <EditExpenseState>[
          EditExpenseState(status: Status.loading),
          EditExpenseState(
              status: Status.loading,
              voyageTitles: [],
              expenseId: expenseModel1.id,
              name: expenseModel1.name,
              price: expenseModel1.price,
              dateAdded: expenseModel1.dateAdded,
              category: expenseModel1.category,
              voyageTitle: voyageModel1.title),
          EditExpenseState(
            status: Status.success,
            voyageTitles: [],
            expenseId: expenseModel1.id,
            name: expenseModel1.name,
            price: expenseModel1.price,
            dateAdded: expenseModel1.dateAdded,
            category: expenseModel1.category,
            voyageTitle: voyageModel1.title,
          ),
        ],
      );
    },
  );
  group(
    'update',
    () {
      blocTest<EditExpenseCubit, EditExpenseState>(
        'should call getVoyageIdByTitle from voyagesRepository and update from expensesRepository when update is called',
        build: () => sut,
        seed: () => currentState,
        act: (cubit) async => cubit.update(),
        wait: const Duration(milliseconds: 300),
        verify: (_) async {
          // Verify if getVoyagesStream is called
          verify(voyagesRepository.getVoyageIdByTitle(any)).called(1);
          // verify(expensesRepository.update(
          //   id: expenseModel1.id,
          //   name: expenseModel1.name,
          //   price: expenseModel1.price,
          //   dateAdded: expenseModel1.dateAdded!,
          //   category: expenseModel1.category,
          //   voyageId: expenseModel1.voyageId,
          // )).called(1);
        },
      );
      blocTest<EditExpenseCubit, EditExpenseState>(
        'should emit FormStatus.submitting then FormStatus.success with successMessage',
        build: () => sut,
        seed: () => currentState,
        act: (cubit) async {
          // set the return value for getVoyageIdByTitle to a known value
          when(voyagesRepository.getVoyageIdByTitle('title'))
              .thenAnswer((_) async => expenseModel1.voyageId);
          when(expensesRepository.update(
                  id: expenseModel1.id,
                  name: expenseModel1.name,
                  price: expenseModel1.price,
                  dateAdded: expenseModel1.dateAdded,
                  category: expenseModel1.category,
                  voyageId: expenseModel1.voyageId))
              .thenAnswer((_) async => expenseModel1);

          await cubit.update();
        },
        expect: () => [
          currentState.copyWith(formStatus: FormStatus.submitting),
          currentState.copyWith(
            formStatus: FormStatus.success,
            successMessage: '${expenseModel1.name} updated',
          ),
        ],
      );
    },
  );
  group(
    'change values',
    () {
      blocTest(
        'should emit new name on changeName',
        build: () => sut,
        seed: () => currentState,
        act: (cubit) async => cubit.changeName(name: 'newName'),
        expect: () => [currentState.copyWith(name: 'newName')],
      );
      blocTest(
        'should emit new price on changePrice',
        build: () => sut,
        seed: () => currentState,
        act: (cubit) async => cubit.changePrice(price: 555),
        expect: () => [currentState.copyWith(price: 555)],
      );
      blocTest(
        'should emit new date on changeDateAdded',
        build: () => sut,
        seed: () => currentState,
        act: (cubit) async => cubit.changeDateAdded(dateAdded: DateTime(2025)),
        expect: () => [currentState.copyWith(dateAdded: DateTime(2025))],
      );
      blocTest(
        'should emit new category on changeCategory',
        build: () => sut,
        seed: () => currentState,
        act: (cubit) async => cubit.changeCategory(category: 'newCategory'),
        expect: () => [currentState.copyWith(category: 'newCategory')],
      );
      blocTest(
        'should emit new voyage title on changeVoyageTitle',
        build: () => sut,
        seed: () => currentState,
        act: (cubit) async =>
            cubit.changeVoyageTitle(voyageTitle: 'newVoyageTitle'),
        expect: () => [currentState.copyWith(voyageTitle: 'newVoyageTitle')],
      );
    },
  );
}
