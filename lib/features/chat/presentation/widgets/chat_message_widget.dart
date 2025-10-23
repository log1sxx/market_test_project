import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  final String message;
  final DateTime timestamp;
  final bool isMe;
  final String? status; // например: 'sent', 'read', null

  const ChatMessageWidget({
    Key? key,
    required this.message,
    required this.timestamp,
    required this.isMe,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = isMe ? Colors.blueAccent : Colors.grey.shade300;
    final textColor = isMe ? Colors.white : Colors.black87;
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = isMe
        ? BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: radius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 3,
                  offset: Offset(1, 2),
                ),
              ],
            ),
            child: Text(
              message,
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: isMe
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Text(
                _formatTimestamp(timestamp),
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
              if (isMe && status != null) ...[
                SizedBox(width: 6),
                Icon(
                  status == 'read' ? Icons.done_all : Icons.done,
                  size: 14,
                  color: status == 'read' ? Colors.blue : Colors.grey,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
