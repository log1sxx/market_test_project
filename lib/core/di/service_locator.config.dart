// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:market_test_project/core/di/service_locator.dart' as _i450;
import 'package:market_test_project/core/network/api_client.dart' as _i888;
import 'package:market_test_project/core/routes/app_router.dart' as _i203;
import 'package:market_test_project/features/banners/data/datasources/banners_remote_datasource.dart'
    as _i1008;
import 'package:market_test_project/features/banners/data/repositories/banners_repository_impl.dart'
    as _i1036;
import 'package:market_test_project/features/banners/domain/repositories/banners_repository.dart'
    as _i332;
import 'package:market_test_project/features/banners/domain/usecases/get_banner_usecase.dart'
    as _i609;
import 'package:market_test_project/features/banners/presentation/bloc/banners_cubit.dart'
    as _i228;
import 'package:market_test_project/features/goods/data/datasources/goods_remote_datasource.dart'
    as _i718;
import 'package:market_test_project/features/goods/data/repositories/products_repository_impl.dart'
    as _i645;
import 'package:market_test_project/features/goods/domain/repositories/products_repository.dart'
    as _i78;
import 'package:market_test_project/features/goods/domain/usecases/get_products_usecase.dart'
    as _i305;
import 'package:market_test_project/features/goods/presentation/bloc/products_cubit.dart'
    as _i257;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final loggerModule = _$LoggerModule();
    final dioModule = _$DioModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.sp,
      preResolve: true,
    );
    gh.singleton<_i974.Logger>(() => loggerModule.logger());
    gh.singleton<_i203.AppRouter>(() => _i203.AppRouter());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i718.GoodsRemoteDatasource>(
      () => _i718.GoodsRemoteDatasourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1008.BannersRemoteDatasource>(
      () => _i1008.BannersRemoteDatasourceImpl(gh<_i361.Dio>()),
    );
    gh.factory<_i888.ApiClient>(() => _i888.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i332.BannersRepository>(
      () => _i1036.BannersRepositoryImpl(gh<_i1008.BannersRemoteDatasource>()),
    );
    gh.factory<_i78.ProductsRepository>(
      () => _i645.ProductsRepositoryImpl(gh<_i718.GoodsRemoteDatasource>()),
    );
    gh.factory<_i609.GetBannerUsecase>(
      () => _i609.GetBannerUsecase(gh<_i332.BannersRepository>()),
    );
    gh.factory<_i305.GetProductsUsecase>(
      () => _i305.GetProductsUsecase(gh<_i78.ProductsRepository>()),
    );
    gh.singleton<_i228.BannersCubit>(
      () => _i228.BannersCubit(gh<_i609.GetBannerUsecase>()),
    );
    gh.singleton<_i257.ProductsCubit>(
      () => _i257.ProductsCubit(gh<_i305.GetProductsUsecase>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i450.SharedPreferencesModule {}

class _$LoggerModule extends _i450.LoggerModule {}

class _$DioModule extends _i450.DioModule {}
