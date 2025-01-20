
import 'package:chatapp/model/model.dart';
import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  final List<ChatModel> _messages = [];

  List<ChatModel> get messages => _messages;

  void sendMessage(String sender, String recipient, String message) {
    _messages.add(ChatModel(
      sender: sender,
      recipient: recipient,
      message: message,
      timestamp: DateTime.now(),
    ));
    notifyListeners();
  }

  List<ChatModel> getMessagesForAdmin() {
    return _messages.where((msg) => msg.recipient == "Admin").toList();
  }

  List<ChatModel> getMessagesBetween(String user, String admin) {
    return _messages.where((msg) =>
      (msg.sender == user && msg.recipient == admin) ||
      (msg.sender == admin && msg.recipient == user)
    ).toList();
  }
}
