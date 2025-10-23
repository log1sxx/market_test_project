import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:market_test_project/features/fcm_notifications/domain/usecases/get_fcm_token_usecase.dart';
import 'package:market_test_project/features/fcm_notifications/domain/usecases/on_message_received_usecase.dart';
import 'package:market_test_project/features/fcm_notifications/domain/usecases/show_notification_usecase.dart';
import 'package:market_test_project/features/fcm_notifications/presentation/bloc/notification_event.dart';
import 'package:market_test_project/features/fcm_notifications/presentation/bloc/notification_state.dart';

@singleton
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetFcmToken getFcmToken;
  final OnMessageReceived onMessageReceived;
  final InternetConnectionChecker internetConnectionChecker;
  StreamSubscription? _subscription;

  NotificationBloc(
    this.getFcmToken,
    this.onMessageReceived,
    this.internetConnectionChecker,
  ) : super(NotificationInitial()) {
    on<InitNotifications>((event, emit) async {
      try {
        final token = await getFcmToken();
        print('FCM Token: $token');
        _subscription = onMessageReceived().listen(
          (notification) => add(NotificationReceived(notification)),
        );
      } catch (e) {
        if (await internetConnectionChecker.hasConnection) {
          emit(InitNotificationsError());
        } else {
          emit(InitNotificationsNetworkError());
        }
      }
    });

    on<NotificationReceived>((event, emit) async {
      try {
        var showNotificationUsecase = GetIt.I<ShowNotification>();
        showNotificationUsecase(
          1,
          event.notification.title ?? '',
          event.notification.body ?? '',
        );
        emit(NotificationLoaded(event.notification));
      } catch (e) {
        if (await internetConnectionChecker.hasConnection) {
          emit(InitNotificationsError());
        } else {
          emit(InitNotificationsNetworkError());
        }
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
