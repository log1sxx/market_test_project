import 'package:injectable/injectable.dart';
import 'package:market_test_project/core/network/api_path.dart';
import 'package:market_test_project/features/chat/data/datasources/websocket_service.dart';
import 'package:market_test_project/features/chat/data/models/message_dto.dart';
import 'package:market_test_project/features/chat/domain/entities/message_entity.dart';
import 'package:market_test_project/features/chat/domain/repositories/chat_repository.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final WebSocketService socketService;

  ChatRepositoryImpl(this.socketService);

  @override
  Stream<MessageEntity> listenMessages() {
    return socketService.messages.map(
      (messageDTO) => MessageEntity(
        messageDTO.sender,
        messageDTO.content,
        messageDTO.timestamp,
      ),
    );
  }

  @override
  Future<void> sendMessage(MessageEntity message) async {
    socketService.send(
      MessageDTO(
        sender: message.sender,
        content: message.content,
        timestamp: message.timestamp,
      ),
    );
  }

  @override
  Future<void> connectToChat() async {
    await socketService.connect(ApiPath.chat);
  }
}
