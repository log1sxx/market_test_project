import 'package:market_test_project/features/chat/domain/entities/message_entity.dart';

abstract class ChatRepository {
  Stream<MessageEntity> listenMessages();
  Future<void> sendMessage(MessageEntity message);
  Future<void> connectToChat();
}
