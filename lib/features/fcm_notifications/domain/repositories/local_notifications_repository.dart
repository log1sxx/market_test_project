abstract class LocalNotificationsRepository {
  Future<void> initializeNotifications();
  Future<void> showNotification(int id, String title, String body);
}
