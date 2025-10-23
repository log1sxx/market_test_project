import 'package:market_test_project/features/chat/domain/entities/message_entity.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatConnected extends ChatState {}

class ChatMessageReceived extends ChatState {
  final MessageEntity message;
  ChatMessageReceived(this.message);
}
