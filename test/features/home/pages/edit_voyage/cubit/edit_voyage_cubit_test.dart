import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/domain/repositories/voyages_repository.dart';
import 'package:voyage_vault/features/home/pages/edit_voyage/cubit/edit_voyage_cubit.dart';

@GenerateNiceMocks([MockSpec<VoyagesRepository>()])
import 'edit_voyage_cubit_test.mocks.dart';

void main() {
  late EditVoyageCubit sut;
  late MockVoyagesRepository voyagesRepository;
  String randomId1 = 'randomId1';
  VoyageModel voyageModel1 = VoyageModel(
      id: 'id',
      title: 'title',
      startDate: DateTime(2020),
      endDate: DateTime(2020),
      location: 'location',
      description: 'description',
      budget: 1.0);

  setUp(
    () {
      voyagesRepository = MockVoyagesRepository();
      sut = EditVoyageCubit(voyagesRepository);
    },
  );

  test('should initialize with default state', () {
    expect(sut.state, equals(EditVoyageState()));
  });

  group('start', () {
    blocTest<EditVoyageCubit, EditVoyageState>(
      'should call getVoyageById from voyagesRepository and getExpensesStreamByVoyageId from expensesRepository when refreshVoyage is called',
      build: () => sut,
      act: (cubit) async => cubit.start(voyageModel: voyageModel1),
      wait: const Duration(milliseconds: 300),
      verify: (_) async {
        // Verify if getVoyagesStream is called
        verify(voyagesRepository.getVoyagesStream()).called(1);
      },
    );
  });
}
