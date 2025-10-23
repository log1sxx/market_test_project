import 'package:market_test_project/features/chat/domain/entities/message_entity.dart';

abstract class ChatEvent {}

class ConnectToChat extends ChatEvent {}

class ConnectChat extends ChatEvent {}

class SendChatMessage extends ChatEvent {
  final String text;
  SendChatMessage(this.text);
}

class ReceiveMessageEvent extends ChatEvent {
  final MessageEntity message;
  ReceiveMessageEvent(this.message);
}
