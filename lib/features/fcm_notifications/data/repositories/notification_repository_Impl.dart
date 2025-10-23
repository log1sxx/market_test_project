import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/fcm_notifications/data/datasources/fcm_remote_source.dart';
import 'package:market_test_project/features/fcm_notifications/domain/entities/notification_entity.dart';
import 'package:market_test_project/features/fcm_notifications/domain/repositories/notification_repository.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final FCMRemoteSource fcmRemoteSource;
  NotificationRepositoryImpl(this.fcmRemoteSource);

  @override
  Future<String?> getToken() => fcmRemoteSource.getToken();

  @override
  Stream<NotificationEntity> listenMessages() =>
      fcmRemoteSource.onMessageStream();
}
