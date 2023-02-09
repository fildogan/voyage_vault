import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:travel_cost_log/domain/repositories/voyages_repository.dart';
import 'package:travel_cost_log/domain/repositories/expenses_repository.dart';
import 'package:travel_cost_log/features/home/pages/edit_expense/cubit/edit_expense_cubit.dart';

@GenerateNiceMocks([MockSpec<VoyagesRepository>()])
@GenerateNiceMocks([MockSpec<ExpensesRepository>()])
import 'edit_expense_cubit_test.mocks.dart';

void main() {
  late EditExpenseCubit sut;
  late MockVoyagesRepository voyagesRepository;
  late MockExpensesRepository expensesRepository;

  setUp(
    () {
      expensesRepository = MockExpensesRepository();
      voyagesRepository = MockVoyagesRepository();
      sut = EditExpenseCubit(voyagesRepository, expensesRepository);
    },
  );

  test('should initialize with default state', () {
    expect(sut.state, equals(EditExpenseState()));
  });
}
