import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:market_test_project/core/di/service_locator.config.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
@InjectableInit(preferRelativeImports: false)
Future<void> initServiceLocator() async {
  await getIt.init();
}

@module
abstract class SharedPreferencesModule {
  @singleton
  @preResolve
  Future<SharedPreferences> get sp => SharedPreferences.getInstance();
}

@module
abstract class FirebaseMessagingModule {
  @singleton
  FirebaseMessaging get fm => FirebaseMessaging.instance;
}

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() => Dio();
}

@module
abstract class LoggerModule {
  @singleton
  Logger logger() => Logger();
}
