// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:voyage_vault/app/cubit/root_cubit.dart' as _i5;
import 'package:voyage_vault/app/injection_container.dart' as _i17;
import 'package:voyage_vault/data/data_sources/remote_data_sources/quotes_remote_data_source.dart'
    as _i12;
import 'package:voyage_vault/domain/repositories/expenses_repository.dart'
    as _i4;
import 'package:voyage_vault/domain/repositories/quotes_repository.dart'
    as _i13;
import 'package:voyage_vault/domain/repositories/voyages_repository.dart'
    as _i6;
import 'package:voyage_vault/features/home/pages/add_expense/cubit/add_expense_cubit.dart'
    as _i7;
import 'package:voyage_vault/features/home/pages/add_page_content/cubit/add_page_content_cubit.dart'
    as _i16;
import 'package:voyage_vault/features/home/pages/add_voyage/cubit/add_voyage_cubit.dart'
    as _i8;
import 'package:voyage_vault/features/home/pages/add_voyager/cubit/add_voyager_cubit.dart'
    as _i3;
import 'package:voyage_vault/features/home/pages/edit_expense/cubit/edit_expense_cubit.dart'
    as _i10;
import 'package:voyage_vault/features/home/pages/edit_voyage/cubit/edit_voyage_cubit.dart'
    as _i11;
import 'package:voyage_vault/features/home/pages/voyage_details/cubit/voyage_details_cubit.dart'
    as _i14;
import 'package:voyage_vault/features/home/pages/voyages_page_content/cubit/voyages_cubit.dart'
    as _i15;

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
    final registerModule = _$RegisterModule();
    gh.factory<_i3.AddVoyagerCubit>(() => _i3.AddVoyagerCubit());
    gh.factory<_i4.ExpensesRepository>(() => _i4.ExpensesRepository());
    gh.factory<_i5.RootCubit>(() => _i5.RootCubit());
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i6.VoyagesRepository>(() => _i6.VoyagesRepository());
    gh.factory<_i7.AddExpenseCubit>(() => _i7.AddExpenseCubit(
          gh<_i6.VoyagesRepository>(),
          gh<_i4.ExpensesRepository>(),
        ));
    gh.factory<_i8.AddVoyageCubit>(
        () => _i8.AddVoyageCubit(gh<_i6.VoyagesRepository>()));
    gh.lazySingleton<_i9.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i10.EditExpenseCubit>(() => _i10.EditExpenseCubit(
          gh<_i6.VoyagesRepository>(),
          gh<_i4.ExpensesRepository>(),
        ));
    gh.factory<_i11.EditVoyageCubit>(
        () => _i11.EditVoyageCubit(gh<_i6.VoyagesRepository>()));
    gh.factory<_i12.QuotesRemoteRetroFitDataSource>(
        () => _i12.QuotesRemoteRetroFitDataSource(gh<_i9.Dio>()));
    gh.factory<_i13.QuotesRepository>(() => _i13.QuotesRepository(
        remoteDataSource: gh<_i12.QuotesRemoteRetroFitDataSource>()));
    gh.factory<_i14.VoyageDetailsCubit>(() => _i14.VoyageDetailsCubit(
          gh<_i6.VoyagesRepository>(),
          gh<_i4.ExpensesRepository>(),
        ));
    gh.factory<_i15.VoyagesCubit>(() => _i15.VoyagesCubit(
          gh<_i6.VoyagesRepository>(),
          gh<_i4.ExpensesRepository>(),
        ));
    gh.factory<_i16.AddPageContentCubit>(
        () => _i16.AddPageContentCubit(gh<_i13.QuotesRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
