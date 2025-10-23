import 'package:market_test_project/features/fcm_notifications/domain/entities/notification_entity.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final NotificationEntity notification;
  NotificationLoaded(this.notification);
}

class InitNotificationsError extends NotificationState {}

class InitNotificationsNetworkError extends NotificationState {}
