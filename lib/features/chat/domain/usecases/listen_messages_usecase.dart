import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/chat/domain/entities/message_entity.dart';
import 'package:market_test_project/features/chat/domain/repositories/chat_repository.dart';

@injectable
class ListenMessagesUsecase {
  final ChatRepository repository;
  ListenMessagesUsecase(this.repository);

  Stream<MessageEntity> call() {
    return repository.listenMessages();
  }
}
