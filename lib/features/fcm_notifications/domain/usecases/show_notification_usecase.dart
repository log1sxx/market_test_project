import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/fcm_notifications/domain/repositories/local_notifications_repository.dart';

@injectable
class ShowNotification {
  final LocalNotificationsRepository repository;

  ShowNotification(this.repository);

  Future<void> call(int id, String title, String body) {
    return repository.showNotification(id, title, body);
  }
}
