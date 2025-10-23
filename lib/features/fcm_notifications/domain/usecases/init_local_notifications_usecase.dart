import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/fcm_notifications/domain/repositories/local_notifications_repository.dart';

@injectable
class InitLocalNotificationsUsecase {
  final LocalNotificationsRepository repository;

  InitLocalNotificationsUsecase(this.repository);

  Future<void> call() {
    return repository.initializeNotifications();
  }
}
