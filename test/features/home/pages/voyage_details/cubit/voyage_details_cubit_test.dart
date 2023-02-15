import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/domain/repositories/expenses_repository.dart';
import 'package:voyage_vault/domain/repositories/voyages_repository.dart';
import 'package:voyage_vault/features/home/pages/voyage_details/cubit/voyage_details_cubit.dart';

@GenerateNiceMocks([MockSpec<VoyagesRepository>()])
@GenerateNiceMocks([MockSpec<ExpensesRepository>()])
import 'voyage_details_cubit_test.mocks.dart';

void main() {
  late VoyageDetailsCubit sut;
  late MockVoyagesRepository voyagesRepository;
  late MockExpensesRepository expensesRepository;
  String randomId1 = 'randomId1';

  setUp(
    () {
      voyagesRepository = MockVoyagesRepository();
      expensesRepository = MockExpensesRepository();
      sut = VoyageDetailsCubit(voyagesRepository, expensesRepository);
    },
  );

  test('should initialize with default state', () {
    expect(sut.state, equals(VoyageDetailsState()));
  });

  group('refreshVoyage', () {
    blocTest<VoyageDetailsCubit, VoyageDetailsState>(
      'should call getVoyageById from voyagesRepository and getExpensesStreamByVoyageId from expensesRepository when refreshVoyage is called',
      build: () => sut,
      act: (cubit) async => cubit.refreshVoyage(randomId1),
      wait: const Duration(milliseconds: 300),
      verify: (_) async {
        // Verify if getVoyagesStream is called
        verify(voyagesRepository.getVoyageById(randomId1)).called(1);
        verify(expensesRepository.getExpensesStreamByVoyageId(randomId1))
            .called(1);
      },
    );
  });
  group(
    'getVoyageWithId',
    () {
      blocTest<VoyageDetailsCubit, VoyageDetailsState>(
        'should call getVoyageById from voyagesRepository when getVoyageWithId is called',
        build: () => sut,
        act: (cubit) async => cubit.getVoyageWithId(randomId1),
        wait: const Duration(milliseconds: 300),
        verify: (_) async {
          // Verify if getVoyagesStream is called
          verify(voyagesRepository.getVoyageById(randomId1)).called(1);
        },
      );
      group(
        'success',
        () {
          setUp(
            () {
              final voyage = VoyageModel(
                  id: randomId1,
                  title: 'title',
                  startDate: DateTime(2020),
                  endDate: DateTime(2020),
                  location: 'location',
                  description: 'description',
                  budget: 1.0);
              when(voyagesRepository.getVoyageById(randomId1)).thenAnswer(
                (_) async => voyage,
              );
            },
          );

          blocTest<VoyageDetailsCubit, VoyageDetailsState>(
            'emits Status.loading then Status.success with result',
            build: () => sut,
            act: (cubit) => cubit.getVoyageWithId(randomId1),
            expect: () => <VoyageDetailsState>[
              VoyageDetailsState(status: Status.loading),
              VoyageDetailsState(
                status: Status.success,
                voyageModel: VoyageModel(
                    id: randomId1,
                    title: 'title',
                    startDate: DateTime(2020),
                    endDate: DateTime(2020),
                    location: 'location',
                    description: 'description',
                    budget: 1.0),
              ),
            ],
          );
        },
      );
      group(
        'failure',
        () {
          final exception = Exception('oops');
          setUp(
            () {
              when(voyagesRepository.getVoyageById(randomId1))
                  .thenThrow(exception);
            },
          );
          blocTest<VoyageDetailsCubit, VoyageDetailsState>(
            'emits Status.loading then Status.error with message',
            build: () => sut,
            act: (cubit) => cubit.getVoyageWithId(randomId1),
            expect: () => <VoyageDetailsState>[
              VoyageDetailsState(status: Status.loading),
              VoyageDetailsState(
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
    'remove',
    () {
      blocTest<VoyageDetailsCubit, VoyageDetailsState>(
        'should call remove from expensesRepository when remove is called',
        build: () => sut,
        act: (cubit) async => cubit.remove(expenseId: randomId1),
        wait: const Duration(milliseconds: 300),
        verify: (_) async {
          // Verify if getVoyagesStream is called
          verify(expensesRepository.remove(id: randomId1)).called(1);
        },
      );
      group(
        'failure',
        () {
          final exception = Exception('oops');
          setUp(
            () {
              when(expensesRepository.remove(id: 'voyageId'))
                  .thenThrow(exception);
            },
          );
          blocTest<VoyageDetailsCubit, VoyageDetailsState>(
            'emits Status.error with message',
            build: () => sut,
            act: (cubit) => cubit.remove(expenseId: 'voyageId'),
            expect: () => <VoyageDetailsState>[
              VoyageDetailsState(
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
