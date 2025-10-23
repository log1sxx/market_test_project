import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/chat/domain/entities/message_entity.dart';
import 'package:market_test_project/features/chat/domain/repositories/chat_repository.dart';

@injectable
class SendMessage {
  final ChatRepository repository;
  SendMessage(this.repository);

  Future<void> call(MessageEntity message) {
    return repository.sendMessage(message);
  }
}
