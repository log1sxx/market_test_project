import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/chat/domain/entities/message_entity.dart';
import 'package:market_test_project/features/chat/domain/repositories/chat_repository.dart';
import 'package:market_test_project/features/chat/domain/usecases/connect_to_chat_usecase.dart';
import 'package:market_test_project/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:market_test_project/features/chat/presentation/bloc/chat_event.dart';
import 'package:market_test_project/features/chat/presentation/bloc/chat_state.dart';

@singleton
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessage sendMessage;
  final ConnectToChatUsecase connectToChatUsecase;
  final ChatRepository repository;
  StreamSubscription? _subscription;

  ChatBloc({
    required this.sendMessage,
    required this.repository,
    required this.connectToChatUsecase,
  }) : super(ChatInitial()) {
    on<ConnectChat>((event, emit) {
      _subscription = repository.listenMessages().listen((message) {
        add(ReceiveMessageEvent(message));
      });
      emit(ChatConnected());
    });

    on<SendChatMessage>((event, emit) async {
      await sendMessage(MessageEntity('me', event.text, DateTime.now()));
    });

    on<ConnectToChat>((event, emit) async {
      await connectToChatUsecase();
    });

    on<ReceiveMessageEvent>((event, emit) {
      emit(ChatMessageReceived(event.message));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
