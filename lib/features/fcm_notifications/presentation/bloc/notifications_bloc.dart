import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/fcm_notifications/domain/usecases/get_fcm_token_usecase.dart';
import 'package:market_test_project/features/fcm_notifications/domain/usecases/on_message_received_usecase.dart';
import 'package:market_test_project/features/fcm_notifications/presentation/bloc/notification_event.dart';
import 'package:market_test_project/features/fcm_notifications/presentation/bloc/notification_state.dart';

@singleton
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetFcmToken getFcmToken;
  final OnMessageReceived onMessageReceived;

  StreamSubscription? _subscription;

  NotificationBloc(this.getFcmToken, this.onMessageReceived)
    : super(NotificationInitial()) {
    on<InitNotifications>((event, emit) async {
      final token = await getFcmToken();
      print('FCM Token: $token');
      _subscription = onMessageReceived().listen(
        (notification) => add(NotificationReceived(notification)),
      );
    });

    on<NotificationReceived>((event, emit) {
      emit(NotificationLoaded(event.notification));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
