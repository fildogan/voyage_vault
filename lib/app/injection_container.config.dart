// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:travel_cost_log/app/cubit/root_cubit.dart' as _i6;
import 'package:travel_cost_log/data/data_sources/remote_data_sources/quotes_remote_data_source.dart'
    as _i4;
import 'package:travel_cost_log/domain/repositories/expenses_repository.dart'
    as _i3;
import 'package:travel_cost_log/domain/repositories/quotes_repository.dart'
    as _i5;
import 'package:travel_cost_log/domain/repositories/voyages_repository.dart'
    as _i7;
import 'package:travel_cost_log/features/home/pages/add_expense/cubit/add_expense_cubit.dart'
    as _i8;
import 'package:travel_cost_log/features/home/pages/add_page_content/cubit/add_page_content_cubit.dart'
    as _i9;
import 'package:travel_cost_log/features/home/pages/add_voyage/cubit/add_voyage_cubit.dart'
    as _i10;
import 'package:travel_cost_log/features/home/pages/edit_expense/cubit/edit_expense_cubit.dart'
    as _i11;
import 'package:travel_cost_log/features/home/pages/edit_voyage/cubit/edit_voyage_cubit.dart'
    as _i12;
import 'package:travel_cost_log/features/home/pages/voyage_details/cubit/voyage_details_cubit.dart'
    as _i13;
import 'package:travel_cost_log/features/home/pages/voyages_page_content/cubit/voyages_cubit.dart'
    as _i14;

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
    gh.factory<_i3.ExpensesRepository>(() => _i3.ExpensesRepository());
    gh.factory<_i4.QuotesRemoteDioDataSource>(
        () => _i4.QuotesRemoteDioDataSource());
    gh.factory<_i5.QuotesRepository>(() => _i5.QuotesRepository(
        remoteDataSource: gh<_i4.QuotesRemoteDioDataSource>()));
    gh.factory<_i6.RootCubit>(() => _i6.RootCubit());
    gh.factory<_i7.VoyagesRepository>(() => _i7.VoyagesRepository());
    gh.factory<_i8.AddExpenseCubit>(() => _i8.AddExpenseCubit(
          gh<_i7.VoyagesRepository>(),
          gh<_i3.ExpensesRepository>(),
        ));
    gh.factory<_i9.AddPageContentCubit>(
        () => _i9.AddPageContentCubit(gh<_i5.QuotesRepository>()));
    gh.factory<_i10.AddVoyageCubit>(
        () => _i10.AddVoyageCubit(gh<_i7.VoyagesRepository>()));
    gh.factory<_i11.EditExpenseCubit>(() => _i11.EditExpenseCubit(
          gh<_i7.VoyagesRepository>(),
          gh<_i3.ExpensesRepository>(),
        ));
    gh.factory<_i12.EditVoyageCubit>(
        () => _i12.EditVoyageCubit(gh<_i7.VoyagesRepository>()));
    gh.factory<_i13.VoyageDetailsCubit>(() => _i13.VoyageDetailsCubit(
          gh<_i7.VoyagesRepository>(),
          gh<_i3.ExpensesRepository>(),
        ));
    gh.factory<_i14.VoyagesCubit>(() => _i14.VoyagesCubit(
          gh<_i7.VoyagesRepository>(),
          gh<_i3.ExpensesRepository>(),
        ));
    return this;
  }
}
