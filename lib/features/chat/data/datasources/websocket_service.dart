import 'dart:async';
import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:market_test_project/features/chat/data/models/message_dto.dart';

@singleton
class WebSocketService {
  late final WebSocketChannel _channel;

  final _controller = StreamController<MessageDTO>();

  Stream<MessageDTO> get messages => _controller.stream;

  Future<void> connect(String url) async {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    _channel.stream.listen(
      (data) {
        MessageDTO message;
        if (data.toString().contains('{')) {
          message = MessageDTO.fromJson(jsonDecode(data));
        } else {
          message = MessageDTO(
            sender: 'sender',
            content: data,
            timestamp: DateTime.now(),
          );
        }
        message = MessageDTO(
          sender: 'sender',
          content: message.content,
          timestamp: message.timestamp,
        );
        _controller.add(message);
      },
      onError: (e) => _controller.addError(e),
      onDone: () => _controller.close(),
    );
  }

  void send(MessageDTO message) {
    _channel.sink.add(jsonEncode(message.toJson()));
  }

  void disconnect() => _channel.sink.close();
}
