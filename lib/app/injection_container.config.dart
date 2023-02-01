// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:travel_cost_log/domain/repositories/expenses_repository.dart'
    as _i7;
import 'package:travel_cost_log/domain/repositories/voyages_repository.dart'
    as _i9;
import 'package:travel_cost_log/features/home/pages/add_expense/cubit/add_expense_cubit.dart'
    as _i3;
import 'package:travel_cost_log/features/home/pages/add_voyage/cubit/add_voyage_cubit.dart'
    as _i4;
import 'package:travel_cost_log/features/home/pages/edit_expense/cubit/edit_expense_cubit.dart'
    as _i5;
import 'package:travel_cost_log/features/home/pages/edit_voyage/cubit/edit_voyage_cubit.dart'
    as _i6;
import 'package:travel_cost_log/features/home/pages/voyage_details/cubit/voyage_details_cubit.dart'
    as _i8;
import 'package:travel_cost_log/features/home/pages/voyages_page_content/cubit/voyages_cubit.dart'
    as _i10;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AddExpenseCubit>(() => _i3.AddExpenseCubit());
    gh.factory<_i4.AddVoyageCubit>(() => _i4.AddVoyageCubit());
    gh.factory<_i5.EditExpenseCubit>(() => _i5.EditExpenseCubit());
    gh.factory<_i6.EditVoyageCubit>(() => _i6.EditVoyageCubit());
    gh.factory<_i7.ExpensesRepository>(() => _i7.ExpensesRepository());
    gh.factory<_i8.VoyageDetailsCubit>(() => _i8.VoyageDetailsCubit());
    gh.factory<_i9.VoyagesRepository>(() => _i9.VoyagesRepository());
    gh.factory<_i10.VoyagesCubit>(() => _i10.VoyagesCubit(
          gh<_i9.VoyagesRepository>(),
          gh<_i7.ExpensesRepository>(),
        ));
    return this;
  }
}
