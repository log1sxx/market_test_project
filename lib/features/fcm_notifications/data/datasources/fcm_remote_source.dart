import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/fcm_notifications/domain/entities/notification_entity.dart';

@injectable
class FCMRemoteSource {
  final FirebaseMessaging _messaging;

  FCMRemoteSource(this._messaging);

  Future<String?> getToken() => _messaging.getToken();

  Stream<NotificationEntity> onMessageStream() {
    return FirebaseMessaging.onMessage.map((RemoteMessage message) {
      return NotificationEntity(
        title: message.notification?.title,
        body: message.notification?.body,
        data: message.data,
      );
    });
  }
}
