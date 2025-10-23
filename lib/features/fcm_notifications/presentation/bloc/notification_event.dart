import 'package:market_test_project/features/fcm_notifications/domain/entities/notification_entity.dart';

abstract class NotificationEvent {}

class InitNotifications extends NotificationEvent {}

class NotificationReceived extends NotificationEvent {
  final NotificationEntity notification;
  NotificationReceived(this.notification);
}
