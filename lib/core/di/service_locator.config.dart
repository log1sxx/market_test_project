// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i163;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:logger/logger.dart' as _i974;
import 'package:market_test_project/core/di/service_locator.dart' as _i450;
import 'package:market_test_project/core/network/api_client.dart' as _i888;
import 'package:market_test_project/core/routes/app_router.dart' as _i203;
import 'package:market_test_project/features/banners/data/datasources/banners_local_datasource.dart'
    as _i926;
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
import 'package:market_test_project/features/chat/data/datasources/websocket_service.dart'
    as _i1030;
import 'package:market_test_project/features/chat/data/repositories/chat_repository_impl.dart'
    as _i869;
import 'package:market_test_project/features/chat/domain/repositories/chat_repository.dart'
    as _i638;
import 'package:market_test_project/features/chat/domain/usecases/connect_to_chat_usecase.dart'
    as _i267;
import 'package:market_test_project/features/chat/domain/usecases/listen_messages_usecase.dart'
    as _i175;
import 'package:market_test_project/features/chat/domain/usecases/send_message_usecase.dart'
    as _i310;
import 'package:market_test_project/features/chat/presentation/bloc/chat_bloc.dart'
    as _i613;
import 'package:market_test_project/features/fcm_notifications/data/datasources/fcm_remote_source.dart'
    as _i911;
import 'package:market_test_project/features/fcm_notifications/data/repositories/local_notifications_service_impl.dart'
    as _i623;
import 'package:market_test_project/features/fcm_notifications/data/repositories/notification_repository_Impl.dart'
    as _i880;
import 'package:market_test_project/features/fcm_notifications/domain/repositories/local_notifications_repository.dart'
    as _i106;
import 'package:market_test_project/features/fcm_notifications/domain/repositories/notification_repository.dart'
    as _i220;
import 'package:market_test_project/features/fcm_notifications/domain/usecases/get_fcm_token_usecase.dart'
    as _i441;
import 'package:market_test_project/features/fcm_notifications/domain/usecases/init_local_notifications_usecase.dart'
    as _i6;
import 'package:market_test_project/features/fcm_notifications/domain/usecases/on_message_received_usecase.dart'
    as _i66;
import 'package:market_test_project/features/fcm_notifications/domain/usecases/show_notification_usecase.dart'
    as _i583;
import 'package:market_test_project/features/fcm_notifications/presentation/bloc/notifications_bloc.dart'
    as _i789;
import 'package:market_test_project/features/goods/data/datasources/goods_local_datasource.dart'
    as _i172;
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
import 'package:market_test_project/features/history/data/datasources/history_local_datasource.dart'
    as _i515;
import 'package:market_test_project/features/history/data/datasources/history_remote_datasource.dart'
    as _i723;
import 'package:market_test_project/features/history/data/repositories/histories_repository_impl.dart'
    as _i453;
import 'package:market_test_project/features/history/domain/repositories/histories_repository.dart'
    as _i6;
import 'package:market_test_project/features/history/domain/usecases/get_histories_usecase.dart'
    as _i250;
import 'package:market_test_project/features/history/presentation/bloc/histories_cubit.dart'
    as _i158;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final firebaseMessagingModule = _$FirebaseMessagingModule();
    final flutterLocalNotificationsPluginModule =
        _$FlutterLocalNotificationsPluginModule();
    final loggerModule = _$LoggerModule();
    final internetCheckerModule = _$InternetCheckerModule();
    final dioModule = _$DioModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.sp,
      preResolve: true,
    );
    gh.singleton<_i892.FirebaseMessaging>(() => firebaseMessagingModule.fm);
    gh.singleton<_i163.FlutterLocalNotificationsPlugin>(
      () =>
          flutterLocalNotificationsPluginModule.flutterLocalNotificationsPlugin,
    );
    gh.singleton<_i974.Logger>(() => loggerModule.logger());
    gh.singleton<_i973.InternetConnectionChecker>(
      () => internetCheckerModule.internetConnectionChecker(),
    );
    gh.singleton<_i203.AppRouter>(() => _i203.AppRouter());
    gh.singleton<_i1030.WebSocketService>(() => _i1030.WebSocketService());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i718.GoodsRemoteDatasource>(
      () => _i718.GoodsRemoteDatasourceImpl(gh<_i361.Dio>()),
    );
    gh.factory<_i911.FCMRemoteSource>(
      () => _i911.FCMRemoteSource(gh<_i892.FirebaseMessaging>()),
    );
    gh.lazySingleton<_i723.HistoryRemoteDatasource>(
      () => _i723.HistoryRemoteDatasourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1008.BannersRemoteDatasource>(
      () => _i1008.BannersRemoteDatasourceImpl(gh<_i361.Dio>()),
    );
    gh.factory<_i888.ApiClient>(() => _i888.ApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i220.NotificationRepository>(
      () => _i880.NotificationRepositoryImpl(gh<_i911.FCMRemoteSource>()),
    );
    gh.lazySingleton<_i638.ChatRepository>(
      () => _i869.ChatRepositoryImpl(gh<_i1030.WebSocketService>()),
    );
    gh.factory<_i267.ConnectToChatUsecase>(
      () => _i267.ConnectToChatUsecase(gh<_i638.ChatRepository>()),
    );
    gh.factory<_i175.ListenMessagesUsecase>(
      () => _i175.ListenMessagesUsecase(gh<_i638.ChatRepository>()),
    );
    gh.factory<_i310.SendMessage>(
      () => _i310.SendMessage(gh<_i638.ChatRepository>()),
    );
    gh.lazySingleton<_i172.GoodsLocalDatasource>(
      () => _i172.GoodsLocalDatasourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i515.HistoriesLocalDatasource>(
      () => _i515.HistoriesLocalDatasourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i926.BannersLocalDatasource>(
      () => _i926.BannersRemoteDatasourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i106.LocalNotificationsRepository>(
      () => _i623.LocalNotificationsServiceImpl(
        gh<_i163.FlutterLocalNotificationsPlugin>(),
      ),
    );
    gh.factory<_i332.BannersRepository>(
      () => _i1036.BannersRepositoryImpl(
        gh<_i1008.BannersRemoteDatasource>(),
        gh<_i926.BannersLocalDatasource>(),
        gh<_i973.InternetConnectionChecker>(),
        gh<_i460.SharedPreferences>(),
      ),
    );
    gh.factory<_i441.GetFcmToken>(
      () => _i441.GetFcmToken(gh<_i220.NotificationRepository>()),
    );
    gh.factory<_i66.OnMessageReceived>(
      () => _i66.OnMessageReceived(gh<_i220.NotificationRepository>()),
    );
    gh.factory<_i78.ProductsRepository>(
      () => _i645.ProductsRepositoryImpl(
        gh<_i718.GoodsRemoteDatasource>(),
        gh<_i172.GoodsLocalDatasource>(),
        gh<_i460.SharedPreferences>(),
        gh<_i973.InternetConnectionChecker>(),
      ),
    );
    gh.factory<_i6.HistoriesRepository>(
      () => _i453.HistoriesRepositoryImpl(
        gh<_i723.HistoryRemoteDatasource>(),
        gh<_i515.HistoriesLocalDatasource>(),
        gh<_i460.SharedPreferences>(),
        gh<_i973.InternetConnectionChecker>(),
      ),
    );
    gh.factory<_i6.InitLocalNotificationsUsecase>(
      () => _i6.InitLocalNotificationsUsecase(
        gh<_i106.LocalNotificationsRepository>(),
      ),
    );
    gh.factory<_i583.ShowNotification>(
      () => _i583.ShowNotification(gh<_i106.LocalNotificationsRepository>()),
    );
    gh.singleton<_i613.ChatBloc>(
      () => _i613.ChatBloc(
        sendMessage: gh<_i310.SendMessage>(),
        repository: gh<_i638.ChatRepository>(),
        connectToChatUsecase: gh<_i267.ConnectToChatUsecase>(),
      ),
    );
    gh.singleton<_i789.NotificationBloc>(
      () => _i789.NotificationBloc(
        gh<_i441.GetFcmToken>(),
        gh<_i66.OnMessageReceived>(),
        gh<_i973.InternetConnectionChecker>(),
      ),
    );
    gh.factory<_i609.GetBannerUsecase>(
      () => _i609.GetBannerUsecase(gh<_i332.BannersRepository>()),
    );
    gh.factory<_i305.GetProductsUsecase>(
      () => _i305.GetProductsUsecase(gh<_i78.ProductsRepository>()),
    );
    gh.factory<_i250.GetHistoriesUsecase>(
      () => _i250.GetHistoriesUsecase(gh<_i6.HistoriesRepository>()),
    );
    gh.singleton<_i228.BannersCubit>(
      () => _i228.BannersCubit(gh<_i609.GetBannerUsecase>()),
    );
    gh.singleton<_i257.ProductsCubit>(
      () => _i257.ProductsCubit(gh<_i305.GetProductsUsecase>()),
    );
    gh.singleton<_i158.HistoriesCubit>(
      () => _i158.HistoriesCubit(gh<_i250.GetHistoriesUsecase>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i450.SharedPreferencesModule {}

class _$FirebaseMessagingModule extends _i450.FirebaseMessagingModule {}

class _$FlutterLocalNotificationsPluginModule
    extends _i450.FlutterLocalNotificationsPluginModule {}

class _$LoggerModule extends _i450.LoggerModule {}

class _$InternetCheckerModule extends _i450.InternetCheckerModule {}

class _$DioModule extends _i450.DioModule {}
