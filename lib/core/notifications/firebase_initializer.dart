import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseInitializer {
  static Future<void> initialize() async {
    try {
      await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: 'AIzaSyA38om1eEueVSDkQKwjLM-z9VkFAq_OgH0',
          appId: '1:834983983726:android:5bf9c25897b245517a047f',
          messagingSenderId: '834983983726',
          projectId: 'test-1834f',
          storageBucket: 'test-1834f.firebasestorage.app',
        ),
      ).timeout(
        Duration(seconds: 5),
        onTimeout: () {
          throw Exception("Firebase initialization timed out");
        },
      );

      FirebaseMessaging messaging = FirebaseMessaging.instance;

      // Разрешения (для iOS)
      await messaging.requestPermission();

      /* // Подписка на тему
      await messaging.subscribeToTopic('global'); */

      // Обработка при получении в фоне
      FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print('FCM background message: ${message.messageId}');
  }
}
