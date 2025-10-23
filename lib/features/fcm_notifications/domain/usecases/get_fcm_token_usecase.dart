import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/fcm_notifications/domain/repositories/notification_repository.dart';

@injectable
class GetFcmToken {
  final NotificationRepository repository;
  GetFcmToken(this.repository);

  Future<String?> call() => repository.getToken();
}
