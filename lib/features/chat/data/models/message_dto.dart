import 'package:json_annotation/json_annotation.dart';

part 'message_dto.g.dart';

@JsonSerializable()
class MessageDTO {
  final String sender;
  final String content;
  final DateTime timestamp;

  MessageDTO({
    required this.sender,
    required this.content,
    required this.timestamp,
  });

  factory MessageDTO.fromJson(Map<String, dynamic> json) =>
      _$MessageDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MessageDTOToJson(this);
}
