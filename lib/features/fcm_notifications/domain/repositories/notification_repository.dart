import 'package:market_test_project/features/fcm_notifications/domain/entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<String?> getToken();
  Stream<NotificationEntity> listenMessages();
}
