import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:travel_cost_log/app/core/enums.dart';
import 'package:travel_cost_log/domain/models/voyage_model.dart';
import 'package:travel_cost_log/domain/repositories/expenses_repository.dart';
import 'package:travel_cost_log/domain/repositories/voyages_repository.dart';
import 'package:travel_cost_log/features/home/pages/voyages_page_content/cubit/voyages_cubit.dart';

@GenerateNiceMocks([MockSpec<VoyagesRepository>()])
@GenerateNiceMocks([MockSpec<ExpensesRepository>()])
import 'voyages_cubit_test.mocks.dart';

// class MockVoyagesRepository extends Mock implements VoyagesRepository {}

// class MockExpensesRepository extends Mock implements ExpensesRepository {}

void main() {
  late VoyagesCubit sut;
  late MockVoyagesRepository voyagesRepository;
  late MockExpensesRepository expensesRepository;

  setUp(
    () {
      voyagesRepository = MockVoyagesRepository();
      expensesRepository = MockExpensesRepository();
      sut = VoyagesCubit(voyagesRepository, expensesRepository);
    },
  );

  test('should initialize with default state', () {
    expect(sut.state, equals(VoyagesState()));
  });

  group(
    'start',
    () {
      blocTest<VoyagesCubit, VoyagesState>(
        'should call getVoyagesStream from repository when start is called',
        build: () => sut,
        act: (cubit) async => cubit.start(),
        verify: (_) async {
          // Verify if getVoyagesStream is called
          verify(voyagesRepository.getVoyagesStream()).called(1);
        },
      );
      blocTest<VoyagesCubit, VoyagesState>('should emit loading state',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
                VoyagesState(
                  status: Status.loading,
                  voyages: [],
                ),
              ]);
      group(
        'success',
        () {
          setUp(
            () {
              final voyages = [
                VoyageModel(
                    id: 'id',
                    title: 'title',
                    startDate: DateTime(2020),
                    endDate: DateTime(2020),
                    location: 'location',
                    description: 'description',
                    budget: 1.0),
                VoyageModel(
                    id: 'id',
                    title: 'title',
                    startDate: DateTime(2020),
                    endDate: DateTime(2020),
                    location: 'location',
                    description: 'description',
                    budget: 1.0),
              ];
              when(voyagesRepository.getVoyagesStream()).thenAnswer(
                (_) => Stream.value(voyages),
              );
              // return sut;
            },
          );
          blocTest<VoyagesCubit, VoyagesState>(
            'emits Status.loading then Status.success with results',
            build: () => sut,
            act: (cubit) async => cubit.start(),
            expect: () => [
              VoyagesState(
                status: Status.loading,
              ),
              VoyagesState(
                status: Status.success,
                voyages: [
                  VoyageModel(
                      id: 'id',
                      title: 'title',
                      startDate: DateTime(2020),
                      endDate: DateTime(2020),
                      location: 'location',
                      description: 'description',
                      budget: 1.0),
                  VoyageModel(
                      id: 'id',
                      title: 'title',
                      startDate: DateTime(2020),
                      endDate: DateTime(2020),
                      location: 'location',
                      description: 'description',
                      budget: 1.0),
                ],
              ),
            ],
          );
        },
      );
      // group(
      //   'failure',
      //   () {
      //     final exception = Exception('oops');
      //     setUp(
      //       () {
      //         when(voyagesRepository.getVoyagesStream());
      //       },
      //     );
      //     blocTest<VoyagesCubit, VoyagesState>(
      //       'emits Status.loading then Status.success with results',
      //       build: () => sut,
      //       act: (cubit) =>
      //           cubit.start()..onError((error, stackTrace) => exception),
      //       expect: () async => <VoyagesState>[
      //         // VoyagesState(
      //         //   status: Status.loading,
      //         //   // voyages: [],
      //         // ),
      //         VoyagesState(
      //           status: Status.error,
      //           errorMessage: exception.toString(),
      //           // voyages: [],
      //         ),
      //       ],
      //     );
      //   },
      // );
    },
  );
  group(
    'remove',
    () {
      blocTest<VoyagesCubit, VoyagesState>(
        'should call remove from repository when remove is called',
        build: () => sut,
        act: (cubit) async => cubit.remove(voyageId: 'voyageId'),
        verify: (_) async {
          // Verify if getVoyagesStream is called
          verify(voyagesRepository.remove(id: 'voyageId')).called(1);
        },
      );
      group(
        'failure',
        () {
          final exception = Exception('oops');
          setUp(
            () {
              when(voyagesRepository.remove(id: 'voyageId'))
                  .thenThrow(exception);
            },
          );
          blocTest<VoyagesCubit, VoyagesState>(
            'emits Status.initial then Status.error with message',
            build: () => sut,
            act: (cubit) => cubit.remove(voyageId: 'voyageId'),
            expect: () => <VoyagesState>[
              VoyagesState(
                status: Status.error,
                errorMessage: exception.toString(),
              ),
            ],
          );
        },
      );
    },
  );
  group(
    'removeExpensesByVoyageId',
    () {
      blocTest<VoyagesCubit, VoyagesState>(
        'should call removeExpensesByVoyageId from repository when removeExpensesByVoyageId is called',
        build: () => sut,
        act: (cubit) async =>
            cubit.removeExpensesByVoyageId(voyageId: 'voyageId'),
        verify: (_) async {
          // Verify if getVoyagesStream is called
          verify(expensesRepository.removeExpensesByVoyageId(
                  voyageId: 'voyageId'))
              .called(1);
        },
      );
      group(
        'failure',
        () {
          final exception = Exception('oops');
          setUp(
            () {
              when(expensesRepository.removeExpensesByVoyageId(
                      voyageId: 'voyageId'))
                  .thenThrow(exception);
            },
          );
          blocTest<VoyagesCubit, VoyagesState>(
            'emits Status.initial then Status.error with message',
            build: () => sut,
            act: (cubit) =>
                cubit.removeExpensesByVoyageId(voyageId: 'voyageId'),
            expect: () => <VoyagesState>[
              VoyagesState(
                status: Status.error,
                errorMessage: exception.toString(),
              ),
            ],
          );
        },
      );
    },
  );
}
