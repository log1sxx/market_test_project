import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/chat/domain/repositories/chat_repository.dart';

@injectable
class ConnectToChatUsecase {
  final ChatRepository repository;
  ConnectToChatUsecase(this.repository);

  Future<void> call() {
    return repository.connectToChat();
  }
}
