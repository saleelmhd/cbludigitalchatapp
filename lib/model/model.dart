class ChatModel {
  final String sender;
  final String recipient;
  final String message;
  final DateTime timestamp;

  ChatModel({
    required this.sender,
    required this.recipient,
    required this.message,
    required this.timestamp,
  });
}
