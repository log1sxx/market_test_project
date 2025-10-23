import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/fcm_notifications/domain/entities/notification_entity.dart';
import 'package:market_test_project/features/fcm_notifications/domain/repositories/notification_repository.dart';

@injectable
class OnMessageReceived {
  final NotificationRepository repository;
  OnMessageReceived(this.repository);

  Stream<NotificationEntity> call() => repository.listenMessages();
}
